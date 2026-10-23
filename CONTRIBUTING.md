# Contributing to SoleSense

Start with the current revision linked from [README.md](README.md).

## Team workflow

1. Create a descriptive branch, such as `hardware/cartridge-fit` or `firmware/hall-readout`.
2. Make a focused change and open a pull request describing its purpose.
3. Include screenshots for geometry changes and observations for physical build or sensor changes.
4. State what was checked, what remains untested, and which hardware/design revision you used.

Coordinate before editing the same FreeCAD or Blender file: binary design files cannot be merged like source code.

## CAD and printed parts

- Keep the current device revision and its matching build package in the working tree. Use Git history for superseded revisions; document the source revision and retained parts when updating the design.
- Preserve the current revision’s bundled source dependencies so its CAD can be rebuilt and its recorded comparison checks remain reproducible.
- Keep dimensions in millimetres and force measurements explicitly in gf or N.
- Include native CAD, editable construction scripts/parameters, exported parts, and relevant validation results with a design revision.
- Keep matching interfaces and fasteners together. Document incompatibilities with previous revisions.
- Use the revision's source scripts to regenerate derived exports where practical. Record native CAD edits that the scripts do not yet reproduce.
- Separate geometry-only checks from actual slicing, printing, assembly and calibration observations.
- Update the root README and CURRENT_DESIGN.md when a new current revision is ready.

## Firmware and software

The `firmware/` and `software/` folders currently contain planning notes only. When adding implementation, document the selected board, toolchain, dependencies, build/run instructions and hardware wiring. Keep credentials out of Git; use `.env.example` with placeholders where needed.

For sensor experiments, retain raw readings, known applied loads, units, orientation, calibration method and hardware revision. Do not describe example or simulated readings as measured results.

## Reporting issues

Include the design/software revision, part number or component, steps to reproduce, expected behavior and observed behavior. For fit issues, include printer, material, slicer settings and measured dimensions when available.

## Historical files

Standalone R03–R07 designs and concept studies have been removed from the working tree. They remain in Git history. R08 includes a small set of historical CAD inputs under `revisions/R08/source/dependencies/` for rebuilding retained geometry and comparing the revision; keep those inputs with R08. Release ZIP metadata describes the contents of that ZIP, not the whole repository.
