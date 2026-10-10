# Troubleshooting

Known problems and quick fixes. Add new ones at the bottom.

---

## SITL: "PreArm: Motors: Check frame class and type"

**Symptom:** `arm throttle` fails. Console shows `Frame: UNSUPPORTED`.

**Cause:** The frame is not defined (`FRAME_CLASS = 0`), so ArduPilot does not know how to drive the motors and refuses to arm.

- `FRAME_CLASS` — motor count / family: `1` Quad, `2` Hexa, `3` Octa, `7` Tri, `0` undefined
- `FRAME_TYPE` — motor layout: `0` Plus (+), `1` X, `3` H

Iris is a Quad X → `FRAME_CLASS 1`, `FRAME_TYPE 1`.

**Fix** (in the MAVProxy terminal):
~param set FRAME_CLASS 1
~param set FRAME_TYPE 1
~reboot
Wait ~30 s after reboot, then arm again.

---

## SIM: Drone wobbles in roll when the gimbal is removed

**Symptom:** With a gimbal-less iris (`iris_with_ardupilot`, or `iris_with_gimbal` with the gimbal deleted), roll oscillates about ±0.006 rad (~0.3°) at ~2 Hz while hovering. Pitch is steady. The fixed camera image shakes slightly.

**Cause:** ArduPilot's `gazebo-iris` parameters are tuned for the iris **with** the gimbal. Without the gimbal's mass the roll controller is slightly too aggressive. Not a camera problem: the same wobble happens with no camera at all.

**Fix (current):** `iuav_iris` includes `iris_with_gimbal` and keeps the gimbal only as ballast; our fixed camera is added on top. Roll stays around ±0.0002 rad.

**Check:** in MAVProxy, `module load graph`, then `graph ATTITUDE.roll ATTITUDE.pitch`.

---

## SIM: Servo channels 9–11 are used by the gimbal

**Symptom:** A servo command on SERVO9 / SERVO10 / SERVO11 moves the gimbal in Gazebo instead of the intended device.

**Cause:** In `iris_with_gimbal`, the ArduPilot plugin maps channels 9–11 to gimbal roll / pitch / yaw.

**Fix:** Do not use SERVO9–11 for the payload release in simulation. Use other outputs (e.g. SERVO12–13) and set them in `sim/params/iuav_sitl.parm`.
