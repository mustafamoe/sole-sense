# R04 geometry verification

Checked on 19 October 2026 using FreeCAD 1.1.3 and its native geometry/mesh tools.

- 24 current printable parts: valid, closed, single-solid STEP geometry.
- 24 current STL exports: closed, one connected component, no reported non-manifold edges or self-intersections.
- Every STL is on Z=0, with mesh volume within 1% of its source solid.
- No nominal assembled intersections above 0.03 mm³ in either head configuration, including the modeled hardware reserves.
- 83 sampled positions across seven motion checks: no interference above 0.03 mm³.
- Five deliberate geometric stop checks confirm locked head retention, slider blocking and axial collar capture.
- All 192 original files listed in the R03 package checksum list match their original hashes.

See `cad_validation.json`, `export_validation.json` and `SUMMARY.json` for the recorded data. `superseded/` contains intermediate generated parts/backups and is not a print source.

These checks establish nominal geometry only. They do not verify strength, tolerance stack-up, continuous motion, hardware selection, contact preload/current, cartridge force, cleaning or patient-contact suitability. Fastener retention, filament-cartridge detent and seating, display cable routing and the electrical/hygiene workflow remain physical design-development items; see `../docs/DESIGN_REVIEW.md`.
