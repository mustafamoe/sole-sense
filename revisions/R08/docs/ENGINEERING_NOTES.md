# Printed flexure: assumptions and verification

## Mechanism

A single planar cassette contains two parallel beams, 27 mm apart along X. The fixed rail bolts to the chassis; the moving rail bolts underneath the rigid carriage. Tip compression moves the carriage and magnet toward the fixed Hall sensor. There is no sliding guide bearing in the sensing path.

The baseline beams are 0.8 mm wide in the X bending direction and 2.4 mm high in Z. The root-line span in Y is 24 mm, with 0.6 mm internal root fillets. The cassette is printed flat in XY. Alternatives have 1.0 and 1.2 mm beam widths. The mounting pattern remains identical.

Compression is geometrically limited to 2.0 mm and extension to 0.6 mm. Stops act on the carriage shoulder. After stop contact, extra tip force bypasses the spring into the housing; the Hall signal then cannot measure total applied force. The stop is not a calibrated force limiter.

The curved 76 × 56 × 44 mm housing, centered filament, 46 mm grip, 62 mm collar and 1.3-inch display geometry are retained. The magnet face is 8.2 mm from the Hall package face at rest, with ±1 mm mount adjustment. This is not the gap to the internal sensing die.

## Preliminary sizing, not performance

For two ideal fixed-guided beams:

`k_total = 2 E b t³ / L³`

Here b = 2.4 mm, t = 0.8/1.0/1.2 mm and L = 24 mm. The accompanying calculation uses **assumed** E values from 1200 to 3500 MPa to show sensitivity. They are not a certified property range for a selected filament. Actual printed stiffness depends on material, paths, dimensions, temperature, loading rate, rail/post compliance and end rotation.

At the illustrative E = 2500 MPa, the 0.8 mm cassette gives k ≈ 0.444 N/mm. Ideal deflections at 1, 10 and 75 gf are about 0.022, 0.221 and 1.655 mm. These are sizing estimates; no Hall resolution or force accuracy follows from them.

At assumed E = 1200 MPa, that same baseline would reach the 2 mm stop at only about 43.5 gf. Thus **75 gf is not assured with cassette 57**. The thicker alternatives are provided so measured stiffness/travel can guide selection. A thicker beam also reduces the displacement produced by 1 gf and increases bending strain at a given travel.

The ideal nominal surface strain `3 t δ / L²` at 2 mm travel is about 0.83%, 1.04% and 1.25% for the three widths. Root fillets, local stress concentration, print defects and viscoelasticity are not resolved by this calculation. It is not a fatigue, yield, creep or service-life qualification.

Printed flexure stages are feasible, as demonstrated in [Sharkey et al., 2016](https://arxiv.org/abs/1509.05394). That work does not validate this design. PLA creep and physical aging remain relevant, including below its glass-transition temperature; see [Fischbach and Weinberg, 2023](https://arxiv.org/abs/2302.11240). Use measured dwell/recovery and repeated-cycle data to evaluate this cassette, especially before claiming 1 gf capability.

## CAD checks and their limits

- `geometry_build.json`: each modeled object is a valid, closed single solid.
- `export_validation.json`: each printable STL is closed, connected, without detected self-intersections/non-manifold edges, at Z≈0, and agrees with its STEP volume within 1%.
- `assembly_checks.json`: unexpected static intersections, sampled rigid travel, all three flexure clearance shapes, sensor adjustment, cartridge rotation/withdrawal, head exchange and intentional engagement beyond both travel stops.
- `service_fixture.json`: bridge clearance and a 3 mm diameter driver-access envelope over each fixed-rail screw.
- `revision_comparison.json`: exact comparison against preserved R07 geometry, with changes limited to the intended parts.
- `plate_validation.json`: millimetre units, nonoverlapping placements and archive/XML integrity for geometry-only 180 × 180 mm 3MF plates.
- `flexure_sizing.json`: reproducible ideal-beam sensitivity calculation, explicitly unvalidated.

Clearance checks use a prescribed beam shape: axial displacement follows `δ(3t²−2t³)`, with approximate lateral shortening `0.6 δ²/L`. The actual filleted outline is sampled and transformed for clearance. This is **not FEA**; the real carriage may rotate or deflect out of plane. The model's 0.1 mm lateral shortening at full compression is an assumption to test.

No physical print, slicer toolpath, stress analysis, fatigue test, force calibration, magnetic-field simulation, drop test, sealing or cleaning validation has been performed. The printed spring is intended for room-temperature bench experiments. The exposed nylon reference is not a calibrated consumable. Existing electrical-contact placeholders and board mounts are not a complete integrated electronics design.

## Rebuild

The FreeCAD file contains named solids and groups, not a fully constrained sketch history. Construction is reproducible through `source/build_model.py` and `source/flexure_geometry.py`. The R04 inputs and R07 comparison baseline are included under `source/dependencies/`.

Use FreeCAD's bundled Python for construction, assembly/export/fixture/revision checks and `package_plates.py`. Use ordinary Python for `calculate_flexure.py` and `package_release.py`, and background Blender for `render_review.py`. Run checks again after geometry changes. Recalibrate after changing the cassette, printer process, magnet, sensor, hardware, cartridge or wiring.
