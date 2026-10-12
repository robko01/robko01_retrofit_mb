# Robko 01 retrofit main board

KiCad hardware design for the Robko 01 retrofit, with an ESP32 interface and six stepper-driver positions.

## Open the design

Open [robko01_retrofit_mb.kicad_pro](hardware/kicad/robko01_retrofit_mb.kicad_pro) in KiCad. The design was saved with KiCad 8; KiCad 9 is installed locally and can render it. The project uses the stable name `robko01_retrofit_mb`; revisions are recorded in Git.

## Repository layout

| Path | Contents |
| --- | --- |
| `hardware/kicad/` | Project, PCB, and schematic sources |
| `docs/bom/` | Component and supplier BOM snapshots |
| `docs/pinmap.md` | ESP32 pin mapping and discrepancies to review |
| `scripts/` | Repeatable local tools |
| `outputs/` | Generated renders, 3D exports, and manufacturing files; ignored by Git |

## Documentation

- [Bill of materials](docs/bom/README.md)
- [ESP32 pin mapping](docs/pinmap.md)
- [Repository working conventions](AGENTS.md)

## Render the board

From the repository root in PowerShell:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\render-board.ps1
```

The command allows this local script to run for that PowerShell process without changing the system execution policy. Requires KiCad 9 or later with its 3D model libraries. The script finds KiCad on PATH or under Program Files. To select an installation:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\render-board.ps1 -KiCadCli 'C:\Program Files\KiCad\9.0\bin\kicad-cli.exe'
```

The angled and top views are written to `outputs/renders/board-3d.png` and `outputs/renders/board-top.png`. Parts without available models appear as footprints only.

## Working conventions

Keep editable design sources and reviewed documentation in Git. Put fresh BOM exports and manufacturing outputs under `outputs/`; update the tracked BOM snapshots deliberately. KiCad automatic backups, caches, and per-user settings are ignored. Use Git commits for design history instead of adding dated project folders.
