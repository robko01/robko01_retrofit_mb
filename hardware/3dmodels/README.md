# Board-local 3D models

## USB-B connector J25

`USB_B_OST_USB-B1HSxx_Horizontal.step` is a downloaded model from [KiCad contribution !635](https://gitlab.com/kicad/libraries/kicad-packages3D/-/merge_requests/635), submitted by `blueskindesign`. The contributor describes it as derived from Molex's 0670688001 CAD model and exported with FreeCAD and KiCad StepUp. The contribution was closed without merging; this file is not part of the installed KiCad library.

- Source revision: `71197eceb7a381aa764fa47c7166660394910b04`.
- [Original STEP file](https://gitlab.com/kicad/libraries/kicad-packages3D/-/blob/71197eceb7a381aa764fa47c7166660394910b04/Connector_USB.3dshapes/USB_B_OST_USB-B1HSxx_Horizontal.step).
- [Direct download](https://gitlab.com/api/v4/projects/21604637/repository/files/Connector_USB.3dshapes%2FUSB_B_OST_USB-B1HSxx_Horizontal.step/raw?ref=71197eceb7a381aa764fa47c7166660394910b04).
- SHA256: `7f06c74cd2a9cdd8592255d0afaf89064e1e14effd26164f7d7c5dfb9c01578b`.
- The upstream [license notice](LICENSE.md) is retained alongside the unchanged model.

This is a visual substitute for J25's `USB_B_Lumberg_2411_02_Horizontal` footprint. Both footprints use the same 2.00 x 2.50 mm signal-pin grid. The OST footprint places the shield pins at X = 4.71 mm and Y = -4.77/7.27 mm; the Lumberg footprint uses X = 4.86 mm and Y = -4.75/7.25 mm. Their body envelopes also differ slightly. Use the [Lumberg datasheet](https://downloads.lumberg.com/datenblaetter/en/2411_02.pdf) for mechanical clearance checks.

The PCB references the STEP file through `${KIPRJMOD}/../3dmodels/` with unit scale and zero rotation and offset. Pad locations, nets, and routing are unchanged. The repository contains the actual downloaded asset, so no extra system library installation is needed.

Board renders remain ignored under `outputs/`. Run `scripts/render-board.ps1` using the command in the root README to regenerate them.
