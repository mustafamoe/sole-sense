# SoleSense R03 — engineering prototype

**Current build:** [R07 sculpted magnetic pressure-head print package](revisions/R07/README.md). Begin with its fit coupons and build guide; the older R03 information below is retained for reference.

A new handle with interchangeable filament and vibration heads, developed in **FreeCAD**, with **Blender** review scenes. The old source files are untouched.

Start with [the assembled preview](previews/01_Assembly.png), [internal packaging](previews/03_Internal_Packaging.png), and [filament mechanism](previews/04_Filament_Mechanism.png).

## Files

- `cad/SoleSense_R03.FCStd` — native CAD solids grouped by assembly. Toggle off `Fit_coupons` and the unused head group when reviewing. Hardware is in a separate group.
- `cad/SoleSense_R03_Filament_head_Assembly.step` and `...Vibration_head_Assembly.step` — alternative complete mechanical assemblies, millimetres.
- `cad/SoleSense_R03_Review.blend` — assembled, exploded, internal and mechanism scenes. Review meshes use the exported CAD geometry.
- `stl/` — 31 separate printable parts, including six fit coupons. Each sits at Z=0 in millimetres.
- `print_plates/` — neutral 3MF geometry plates arranged within 180 × 180; select your actual printer and PETG profile in Bambu Studio. Not pre-sliced.
- `source/build_model.py` and `source/interface_config.json` — reproducible CAD source and interface dimensions. Native objects are editable solids; this is not a fully constrained sketch-based feature tree.
- `validation/` — CAD, movement, mesh and plate checks.
- `reference/` — assembly-position meshes and nominal hardware envelopes; not for printing.

## Decisions and build information

- [Everything selected or changed](docs/decisions.md)
- [Head connector, wiring allocation and swapping procedure](docs/wiring.md)
- [PETG settings, hardware, assembly and physical checks](docs/assembly_and_printing.md)

The key decisions are replaceable potted nylon inserts, a three-position carrier spanning 120° total, a contact-free travel sensor, a regulated 5 V servo supply, and a keyed mechanical head joint with a manually disconnected six-wire plug and strain relief.

**Status: bench engineering prototype.** The geometry can be reviewed and test-printed. Actual module fit, print tolerances, electronics, guide friction and the complete-assembly 1 / 10 / 75 gf outputs still require physical verification. Generic-module size limits are chosen specifications, not verified dimensions of hardware the user owns. No clinical accuracy is claimed.

## Rebuild

On this Mac, use `/Applications/FreeCAD.app/Contents/Resources/bin/python source/build_model.py`, followed by the same Python for `source/validate_exports.py`, `source/check_filament_sweep.py` and `source/package_plates.py`. Blender review generation uses `/Applications/Blender.app/Contents/MacOS/Blender --background --factory-startup --python source/render_model.py`.

Do not print `reference/` meshes or either assembled STEP as a single solid. Choose one head at a time for assembly review. Print the fit coupons first.
