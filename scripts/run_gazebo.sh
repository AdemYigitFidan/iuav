#!/usr/bin/env bash
# Start the iuav Gazebo world (server + optional GUI) and the ROS 2 camera bridge.
#
#   bash scripts/run_gazebo.sh                 -> server + GUI + bridge
#   HEADLESS=1 bash scripts/run_gazebo.sh      -> server + bridge, no GUI
#   BRIDGE=0 bash scripts/run_gazebo.sh        -> no ROS 2 bridge
#   GZ_SOFTWARE_GUI=1 bash scripts/run_gazebo.sh -> GUI with software OpenGL (slow, NVIDIA/EGL workaround)
#   WORLD=sim/worlds/other.sdf bash scripts/run_gazebo.sh
#
# Server and GUI run as separate processes: if the GUI fails, the server
# (physics, ArduPilot plugin, camera) keeps running.
# Stop everything with Ctrl+C in this terminal.
# Then, in a second terminal: bash scripts/run_sitl.sh
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WORLD="${WORLD:-$REPO_ROOT/sim/worlds/iuav_field.sdf}"
[[ "$WORLD" = /* ]] || WORLD="$REPO_ROOT/$WORLD"
BRIDGE_CONFIG="$REPO_ROOT/sim/config/gz_bridge.yaml"

log()  { echo "[run_gazebo] $*"; }
fail() { echo "[run_gazebo] ERROR: $*" >&2; exit 1; }

# --- Checks -----------------------------------------------------------------
[ -f "$WORLD" ] || fail "world file not found: $WORLD"
command -v gz >/dev/null 2>&1 || fail "'gz' not found. Is Gazebo Harmonic installed?"

if pgrep -f "gz sim" >/dev/null 2>&1; then
    echo "[run_gazebo] ERROR: a Gazebo process is already running:" >&2
    pgrep -af "gz sim" >&2
    echo "[run_gazebo] Stop it first:  pkill -f \"gz sim\"; pkill -f parameter_bridge" >&2
    exit 1
fi

# ArduPilot plugin: use GZ_SIM_SYSTEM_PLUGIN_PATH from ~/.bashrc, else try common locations
plugin_found() {
    local IFS=:
    for d in ${GZ_SIM_SYSTEM_PLUGIN_PATH:-}; do
        [ -f "$d/libArduPilotPlugin.so" ] && return 0
    done
    return 1
}
if ! plugin_found; then
    for d in "$HOME/dev/ardupilot/ardupilot_gazebo" "$HOME/ardupilot_gazebo"; do
        if [ -f "$d/build/libArduPilotPlugin.so" ]; then
            export GZ_SIM_SYSTEM_PLUGIN_PATH="$d/build:${GZ_SIM_SYSTEM_PLUGIN_PATH:-}"
            export GZ_SIM_RESOURCE_PATH="$d/models:$d/worlds:${GZ_SIM_RESOURCE_PATH:-}"
            break
        fi
    done
    plugin_found || fail "libArduPilotPlugin.so not found. Run scripts/check_sim_env.sh"
fi

# Our models (iuav_iris)
export GZ_SIM_RESOURCE_PATH="$REPO_ROOT/sim/models:${GZ_SIM_RESOURCE_PATH:-}"

WORLD_NAME="$(grep -oP '<world name="\K[^"]+' "$WORLD" | head -1 || true)"
[ -n "$WORLD_NAME" ] || fail "could not read <world name> from $WORLD"

# --- Cleanup on exit (Ctrl+C, terminal close, error) -------------------------
PIDS=()
MY_PGID="$(ps -o pgid= -p $$ | tr -d ' ')"
cleanup() {
    trap - EXIT INT TERM
    log "stopping..."
    for pid in "${PIDS[@]}"; do kill "$pid" 2>/dev/null || true; done
    # Also catch gz child processes, but only those in our own process group
    pkill -g "$MY_PGID" -f "gz sim" 2>/dev/null || true
    pkill -g "$MY_PGID" -f parameter_bridge 2>/dev/null || true
    wait 2>/dev/null || true
    log "done."
}
trap cleanup EXIT INT TERM

# --- Server -------------------------------------------------------------------
log "starting server (world: $WORLD_NAME)"
gz sim -s -r -v 1 "$WORLD" &
SERVER_PID=$!
PIDS+=("$SERVER_PID")

log "waiting for the server to be ready..."
for _ in $(seq 1 60); do
    TOPICS="$(gz topic -l 2>/dev/null || true)"
    if grep -qx "/world/$WORLD_NAME/clock" <<< "$TOPICS"; then
        READY=1; break
    fi
    kill -0 "$SERVER_PID" 2>/dev/null || fail "server exited during startup"
    sleep 1
done
[ "${READY:-0}" = 1 ] || fail "server not ready after 60 s"
log "server READY"

# --- ROS 2 camera bridge -------------------------------------------------------
if [ "${BRIDGE:-1}" = 1 ]; then
    if command -v ros2 >/dev/null 2>&1; then
        mkdir -p "$REPO_ROOT/sim/.run"
        log "starting ros_gz_bridge (/camera/image_raw, /camera/camera_info), log: sim/.run/bridge.log"
        ros2 run ros_gz_bridge parameter_bridge --ros-args \
            -p config_file:="$BRIDGE_CONFIG" > "$REPO_ROOT/sim/.run/bridge.log" 2>&1 &
        PIDS+=($!)
    else
        log "WARN: 'ros2' not found (source /opt/ros/jazzy/setup.bash). Bridge skipped."
    fi
fi

# --- GUI (optional) ----------------------------------------------------------
if [ "${HEADLESS:-0}" = 1 ]; then
    log "HEADLESS=1, GUI skipped"
else
    if [ "${GZ_SOFTWARE_GUI:-0}" = 1 ]; then
        log "GUI with software OpenGL"
        export LIBGL_ALWAYS_SOFTWARE=1 GALLIUM_DRIVER=llvmpipe
    fi
    log "starting GUI (if it fails, the server keeps running)"
    gz sim -g -v 1 &
    PIDS+=($!)
fi

log "running. Next: bash scripts/run_sitl.sh  (Ctrl+C here stops everything)"
wait "$SERVER_PID"
