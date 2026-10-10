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
