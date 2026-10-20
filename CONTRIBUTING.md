# Contributing to SoleSense

Start with the current revision linked from [README.md](README.md).

## Team workflow

1. Create a descriptive branch, such as `hardware/cartridge-fit` or `firmware/hall-readout`.
2. Make a focused change and open a pull request describing its purpose.
3. Include screenshots for geometry changes and observations for physical build or sensor changes.
4. State what was checked, what remains untested, and which hardware/design revision you used.

Coordinate before editing the same FreeCAD or Blender file: binary design files cannot be merged like source code.

## CAD and printed parts

- Preserve released revision folders and ZIPs. Develop the next design in a new revision folder; document the source revision and retained parts.
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

The root CAD and print folders belong to R03. Root checksum manifests describe historical packages, not the current repository tree. Do not regenerate them to imply validation of unrelated revisions.
