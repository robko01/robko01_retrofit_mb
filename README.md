# Robko 01 retrofit main board

KiCad hardware design for the Robko 01 retrofit, with an ESP32 interface and six stepper-driver positions.

## Open the design

Open [robko01_retrofit_mb.kicad_pro](hardware/kicad/robko01_retrofit_mb.kicad_pro) in KiCad. The design was saved with KiCad 8; KiCad 9 is installed locally and can render it. The project uses the stable name `robko01_retrofit_mb`; revisions are recorded in Git.

## Repository layout

| Path | Contents |
| --- | --- |
| `hardware/kicad/` | Project, PCB, and schematic sources |
| `hardware/3dmodels/` | Board-local component models and their provenance |
| `docs/pinmap.md` | ESP32 pin mapping and discrepancies to review |
| `scripts/` | Repeatable local tools |
| `outputs/` | Generated renders, 3D exports, and manufacturing files; ignored by Git |

## Documentation

- [ESP32 pin mapping](docs/pinmap.md)
- [Board-local 3D models](hardware/3dmodels/README.md)
- [Repository working conventions](AGENTS.md)

## Render the board

From the repository root in PowerShell:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\render-board.ps1
```

The command allows this local script to run for that PowerShell process without changing the system execution policy. Requires KiCad 9 or later; component models are included in this repository. The script finds KiCad on PATH or under Program Files. To select an installation:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\render-board.ps1 -KiCadCli 'C:\Program Files\KiCad\9.0\bin\kicad-cli.exe'
```

The angled and top views are written to `outputs/renders/board-3d.png` and `outputs/renders/board-top.png`. The script uses an isolated configuration under `outputs/render-config/` to show both SMD and through-hole models while preserving personal KiCad settings. All 68 physical components have models; the 16 solder jumpers appear as PCB pads. See [model sources and approximations](hardware/3dmodels/README.md).

In KiCad's interactive 3D Viewer, enable **SMD Models** in the Appearance panel to show the diodes and surface-mount resistors and capacitors. The `S` shortcut toggles this visibility setting; it is saved in your local KiCad settings, separately from the board's model assignments. See the [KiCad 3D Viewer documentation](https://docs.kicad.org/9.0/en/pcbnew/pcbnew.html#_3d_viewer).

## Working conventions

Keep editable design sources and reviewed documentation in Git. Put generated exports and manufacturing outputs under `outputs/`. KiCad automatic backups, caches, and per-user settings are ignored. Use Git commits for design history instead of adding dated project folders.
