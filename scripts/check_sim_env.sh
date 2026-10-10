#!/usr/bin/env bash
# check_sim_env.sh — Checks that this machine has everything needed to run the iuav simulation.
# Read-only: installs nothing, changes nothing.
# Usage: bash scripts/check_sim_env.sh

# ---------- output helpers ----------
if [ -t 1 ]; then
  GREEN="\033[32m"; RED="\033[31m"; YELLOW="\033[33m"; BOLD="\033[1m"; RESET="\033[0m"
else
  GREEN=""; RED=""; YELLOW=""; BOLD=""; RESET=""
fi

FAILS=0
WARNS=0

ok()   { printf "  ${GREEN}[ OK ]${RESET} %s\n" "$1"; }
fail() { printf "  ${RED}[FAIL]${RESET} %s\n" "$1"; printf "         → %s\n" "$2"; FAILS=$((FAILS + 1)); }
warn() { printf "  ${YELLOW}[WARN]${RESET} %s\n" "$1"; printf "         → %s\n" "$2"; WARNS=$((WARNS + 1)); }
section() { printf "\n${BOLD}%s${RESET}\n" "$1"; }

# Search a ':'-separated path list for a file or directory name
find_in_pathlist() {
  local list="$1" name="$2" dir
  IFS=':' read -ra dirs <<< "$list"
  for dir in "${dirs[@]}"; do
    [ -n "$dir" ] && [ -e "$dir/$name" ] && { echo "$dir/$name"; return 0; }
  done
  return 1
}

printf "${BOLD}iuav — simulation environment check${RESET}\n"

# ---------- 1. Operating system ----------
section "1. Operating system"
if [ -r /etc/os-release ]; then
  . /etc/os-release
  if [ "${ID:-}" = "ubuntu" ] && [ "${VERSION_ID:-}" = "24.04" ]; then
    ok "Ubuntu 24.04"
  else
    fail "Found ${PRETTY_NAME:-unknown OS}, expected Ubuntu 24.04" \
         "ROS 2 Jazzy and Gazebo Harmonic are supported on Ubuntu 24.04."
  fi
else
  fail "Cannot read /etc/os-release" "Is this a Linux system?"
fi

# ---------- 2. ROS 2 ----------
section "2. ROS 2"
if [ -f /opt/ros/jazzy/setup.bash ]; then
  ok "ROS 2 Jazzy installed"
  # Source it inside this script only (does not affect your terminal)
  # shellcheck disable=SC1091
  source /opt/ros/jazzy/setup.bash
  if command -v ros2 >/dev/null 2>&1; then
    ok "ros2 command available"
  else
    fail "ros2 command not found" "Reinstall ROS 2 Jazzy (ros-jazzy-desktop)."
  fi

  for pkg in mavros ros_gz_bridge; do
    if ros2 pkg prefix "$pkg" >/dev/null 2>&1; then
      ok "ROS package: $pkg"
    else
      fail "ROS package missing: $pkg" \
           "sudo apt install ros-jazzy-$(echo "$pkg" | tr '_' '-')"
    fi
  done
else
  fail "ROS 2 Jazzy not found in /opt/ros/jazzy" \
       "Install ROS 2 Jazzy: https://docs.ros.org/en/jazzy/Installation.html"
fi

# ---------- 3. Gazebo ----------
section "3. Gazebo"
if command -v gz >/dev/null 2>&1; then
  GZ_VER=$(gz sim --version 2>/dev/null | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -n 1)
  if [ -z "$GZ_VER" ]; then
    fail "gz found but 'gz sim' does not respond" "Install Gazebo Harmonic (gz-harmonic)."
  elif [ "${GZ_VER%%.*}" = "8" ]; then
    ok "Gazebo Harmonic ($GZ_VER)"
  else
    fail "Gazebo $GZ_VER found, expected Harmonic (8.x)" "Install Gazebo Harmonic (gz-harmonic)."
  fi
else
  fail "Gazebo not found (gz command missing)" "Install Gazebo Harmonic (gz-harmonic)."
fi

# ---------- 4. ArduPilot SITL ----------
section "4. ArduPilot SITL"
if SIM_VEHICLE=$(command -v sim_vehicle.py 2>/dev/null); then
  ok "sim_vehicle.py found"
  AP_ROOT=$(cd "$(dirname "$SIM_VEHICLE")/../.." 2>/dev/null && pwd)
  AP_VER=$(git -C "$AP_ROOT" describe --tags 2>/dev/null)
  if [ -n "$AP_VER" ]; then
    ok "ArduPilot source: $AP_VER"
  else
    warn "Could not read ArduPilot version" "Not critical; check that ArduPilot was cloned with git."
  fi
else
  fail "sim_vehicle.py not in PATH" \
       "Add ArduPilot/Tools/autotest to PATH in ~/.bashrc, then open a new terminal."
fi

if command -v mavproxy.py >/dev/null 2>&1; then
  ok "MAVProxy found"
else
  fail "MAVProxy not found" "pip install MAVProxy (or run ArduPilot's install-prereqs script)."
fi

# ---------- 5. ardupilot_gazebo plugin ----------
section "5. ardupilot_gazebo plugin"
if [ -z "${GZ_SIM_SYSTEM_PLUGIN_PATH:-}" ]; then
  fail "GZ_SIM_SYSTEM_PLUGIN_PATH is not set" \
       "Add 'export GZ_SIM_SYSTEM_PLUGIN_PATH=<ardupilot_gazebo>/build:\$GZ_SIM_SYSTEM_PLUGIN_PATH' to ~/.bashrc."
elif PLUGIN=$(find_in_pathlist "$GZ_SIM_SYSTEM_PLUGIN_PATH" "libArduPilotPlugin.so"); then
  ok "ArduPilot Gazebo plugin found"
else
  fail "libArduPilotPlugin.so not found in GZ_SIM_SYSTEM_PLUGIN_PATH" \
       "Build ardupilot_gazebo (mkdir build && cd build && cmake .. && make)."
fi

if [ -z "${GZ_SIM_RESOURCE_PATH:-}" ]; then
  fail "GZ_SIM_RESOURCE_PATH is not set" \
       "Add 'export GZ_SIM_RESOURCE_PATH=<ardupilot_gazebo>/models:<ardupilot_gazebo>/worlds:\$GZ_SIM_RESOURCE_PATH' to ~/.bashrc."
elif find_in_pathlist "$GZ_SIM_RESOURCE_PATH" "iris_with_standoffs" >/dev/null; then
  ok "ardupilot_gazebo models found (iris)"
else
  fail "Iris model not found in GZ_SIM_RESOURCE_PATH" \
       "Point GZ_SIM_RESOURCE_PATH to ardupilot_gazebo/models."
fi

# ---------- summary ----------
printf "\n${BOLD}Result:${RESET} "
if [ "$FAILS" -eq 0 ]; then
  printf "${GREEN}ready for simulation${RESET}"
  [ "$WARNS" -gt 0 ] && printf " (%d warning)" "$WARNS"
  printf "\n"
  exit 0
else
  printf "${RED}%d problem(s) found${RESET} — fix the [FAIL] lines above and run again.\n" "$FAILS"
  exit 1
fi
