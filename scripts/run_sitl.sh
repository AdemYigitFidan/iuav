#!/usr/bin/env bash
# run_sitl.sh — Start ArduCopter SITL connected to Gazebo (JSON backend).
# Start Gazebo with the iuav_field world first, then run this in a second terminal.
#
# Usage:
#   bash scripts/run_sitl.sh            normal start (keeps saved params)
#   WIPE=1 bash scripts/run_sitl.sh     start with clean params (deletes saved eeprom)
#
# Location defaults to ArduPilot's CMAC test site (Canberra) — must match the
# <spherical_coordinates> in sim/worlds/iuav_field.sdf. Override with LAT/LON/ALT/HDG.

set -e

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

LAT="${LAT:--35.363262}"
LON="${LON:-149.165237}"
ALT="${ALT:-584}"
HDG="${HDG:-90}"

# ---- Find ArduPilot ----
if ! command -v sim_vehicle.py >/dev/null 2>&1; then
  echo "ERROR: sim_vehicle.py not found in PATH. Run scripts/check_sim_env.sh." >&2
  exit 1
fi
AUTOTEST_DIR="$(dirname "$(command -v sim_vehicle.py)")"
AP_ROOT="$(cd "$AUTOTEST_DIR/../.." && pwd)"

# ---- Parameter files ----
# With --model JSON, sim_vehicle.py does not load gazebo-iris.parm (FRAME_CLASS etc.),
# which causes "PreArm: Motors: Check frame class and type". Add them explicitly.
# Order matters: later files override earlier ones; our repo file comes last.
PARAM_ARGS=()
for f in "$AUTOTEST_DIR/default_params/copter.parm" \
         "$AUTOTEST_DIR/default_params/gazebo-iris.parm" \
         "$REPO_ROOT/sim/params/iuav_sitl.parm"; do
  if [ -f "$f" ]; then
    PARAM_ARGS+=("--add-param-file=$f")
    echo "[sitl] param file: $f"
  fi
done

# ---- Options ----
EXTRA_ARGS=()
# Skip the build check if ArduCopter is already built (faster start)
[ -x "$AP_ROOT/build/sitl/bin/arducopter" ] && EXTRA_ARGS+=(--no-rebuild)
# Clean start: wipe saved parameters
[ "${WIPE:-0}" = "1" ] && EXTRA_ARGS+=(-w) && echo "[sitl] WIPE=1: saved parameters will be reset"

# All SITL output (eeprom.bin, logs/, terrain/, mav.*) goes here, not into the current folder
RUN_DIR="$REPO_ROOT/sim/.run"
mkdir -p "$RUN_DIR"

# ---- Checks ----
if ! pgrep -f "gz sim" >/dev/null 2>&1; then
  echo "WARNING: Gazebo does not seem to be running. Start the world first."
fi

# Keep the ArduCopter terminal window visible
export SITL_RITW_MINIMIZE=0

# Print a READY line once SITL is listening on TCP 5760
(
  for _ in $(seq 1 90); do
    if ss -ltn 2>/dev/null | grep -q ":5760"; then
      echo "[sitl] READY: listening on TCP 5760"
      exit 0
    fi
    sleep 1
  done
  echo "[sitl] WARNING: TCP 5760 not open after 90 s — is Gazebo running?"
) &

echo "[sitl] location: $LAT,$LON,$ALT,$HDG"
echo "[sitl] output dir: $RUN_DIR"

exec sim_vehicle.py -v ArduCopter -f gazebo-iris --model JSON \
  "${PARAM_ARGS[@]}" "${EXTRA_ARGS[@]}" \
  --custom-location="${LAT},${LON},${ALT},${HDG}" -I0 \
  --use-dir="$RUN_DIR" \
  --map --console
