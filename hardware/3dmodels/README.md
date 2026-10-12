# Board-local 3D models

All 68 physical components on the PCB have project-relative model references under `${KIPRJMOD}/../3dmodels/`. The 16 solder jumpers are copper features and need no separate component bodies. Model-only changes preserve every footprint, pad, net, track, via, and zone.

| Asset group | Use | Source and license |
| --- | --- | --- |
| `kicad/` | Standard connectors, sockets, passives, LEDs, semiconductors, switches, and relay | KiCad community models copied unchanged from the installed KiCad 9.0 library; [license](kicad/LICENSE.md) and [file hashes](kicad/manifest.json) |
| `pololu/` | A1–A6 A4988 carrier boards | Unmodified manufacturer STEP download; [source notice](pololu/NOTICE.md) |
| `custom/` | F1 fuse and clips | Original simplified visual model; CC0-1.0; [generator](custom/build-fuse-model.py) |
| `USB_B_OST_USB-B1HSxx_Horizontal.step` | J25 USB-B connector | KiCad contribution described below |

## A4988 modules A1–A6

The carrier model is downloaded from [Pololu's official resources](https://www.pololu.com/product/1182/resources), rather than approximating the driver board. Each module also has two KiCad 1x08 pin-socket models, aligned to the existing 12.7 mm row spacing and 2.54 mm pin pitch. The carrier transform is offset (-1.27, -19.05, 8.5) mm, with unit scale and no rotation. The 8.5 mm assembly elevation is a visual mounting assumption; confirm it against the sockets and headers selected for assembly. No ESP32 development board is added because the design contains its separate connector footprints, without a specified module part.

## Fuse F1

`custom/Fuse_5x20_Bel_FC203_approx.wrl` shows a 5x20 mm cartridge and two open spring clips aligned to the footprint's 17.8 x 5.0 mm pin arrangement. It is an original visual approximation, not manufacturer CAD. The clips, glass body, and end caps are modeled for board previews; use the component datasheet for clearance decisions. Run `python hardware/3dmodels/custom/build-fuse-model.py` from the repository root to regenerate it. The generator and model are released under [CC0-1.0](https://creativecommons.org/publicdomain/zero/1.0/).

## USB-B connector J25

`USB_B_OST_USB-B1HSxx_Horizontal.step` is a downloaded model from [KiCad contribution !635](https://gitlab.com/kicad/libraries/kicad-packages3D/-/merge_requests/635), submitted by `blueskindesign`. The contributor describes it as derived from Molex's 0670688001 CAD model and exported with FreeCAD and KiCad StepUp. The contribution was closed without merging; this file is not part of the installed KiCad library.

- Source revision: `71197eceb7a381aa764fa47c7166660394910b04`.
- [Original STEP file](https://gitlab.com/kicad/libraries/kicad-packages3D/-/blob/71197eceb7a381aa764fa47c7166660394910b04/Connector_USB.3dshapes/USB_B_OST_USB-B1HSxx_Horizontal.step).
- [Direct download](https://gitlab.com/api/v4/projects/21604637/repository/files/Connector_USB.3dshapes%2FUSB_B_OST_USB-B1HSxx_Horizontal.step/raw?ref=71197eceb7a381aa764fa47c7166660394910b04).
- SHA256: `7f06c74cd2a9cdd8592255d0afaf89064e1e14effd26164f7d7c5dfb9c01578b`.
- The upstream [license notice](LICENSE.md) is retained alongside the unchanged model.

This is a visual substitute for J25's `USB_B_Lumberg_2411_02_Horizontal` footprint. Both footprints use the same 2.00 x 2.50 mm signal-pin grid. The OST footprint places the shield pins at X = 4.71 mm and Y = -4.77/7.27 mm; the Lumberg footprint uses X = 4.86 mm and Y = -4.75/7.25 mm. Their body envelopes also differ slightly. Use the [Lumberg datasheet](https://downloads.lumberg.com/datenblaetter/en/2411_02.pdf) for mechanical clearance checks.

The PCB references the STEP file through `${KIPRJMOD}/../3dmodels/` with unit scale and zero rotation and offset. Pad locations, nets, and routing are unchanged. The repository contains the actual downloaded asset, so no extra system library installation is needed.

Board renders remain ignored under `outputs/`. Run `scripts/render-board.ps1` using the command in the root README to regenerate them. The renderer requires no external component model libraries.
