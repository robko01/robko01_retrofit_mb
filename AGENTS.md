# Repository conventions

This repository contains the Robko 01 retrofit main board hardware.

- Keep KiCad design sources in `hardware/kicad/`. Use the shared basename `robko01_retrofit_mb` for the project, PCB, and schematic. Keep internal schematic references consistent; do not add dates to project names.
- Keep ESP32 pin mappings in `docs/pinmap.md`. The previous BOM snapshots have been removed pending a replacement; do not recreate them.
- Put generated renders, BOM exports, Gerbers, drill files, and 3D exports under ignored `outputs/`.
- Keep repeatable local workflows in `scripts/`. Run `scripts/render-board.ps1` to generate the board previews with KiCad 9 or later.
- Preserve existing board edits during maintenance. Do not silently change electrical design or resolve pin mapping discrepancies by guessing.
- Use Git history for revisions. Do not introduce dated project folders or track KiCad backups, caches, or per-user settings.
- When moving design files, verify their contents are preserved and check that KiCad can still load the PCB and schematic.
- Keep the README's project links and commands consistent with the layout.
- Commit and push only when requested by the user.
