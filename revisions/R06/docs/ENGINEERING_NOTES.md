# Mechanical basis and verification boundaries

## Geometry chosen for a buildable first prototype

The C03 magnetic animation used schematic compliant plates. R05 replaced those with **two straight, parallel, screw-clamped leaves** that can be cut from stock without drilling their working areas. Both leaves extend from the same side of the housing. This permits the small lateral shortening that accompanies bending; opposing fully constrained radial leaves would develop additional stretching forces.

Each leaf is 28 × 12 × 0.10 mm, with 5 mm clamped at each end and an 18 mm free span. The stations are 27 mm apart along the device axis. A rigid printed carriage joins the moving ends, carries the retained 6 × 3 mm magnet at the rear and receives the cartridge at the front. There is no rubbing guide bearing in the sensing path. The nose opening and stop structures have clearance throughout the modeled travel.

Compression travel is limited geometrically to 2.4 mm; extension travel is limited to 1.0 mm. The large carriage shoulder contacts the chassis stops. A removable M3 screw holds the shoulder during service, and a separate assembly bridge permits access to the leaves while this pin is fitted. This is a manually removed service lock, not an automatic interlock.

The cartridge retains the R04 bayonet profile with an added radial M2 locking screw and blind pocket. The small knob must be backed out before rotation. The reference nylon remains Ø0.9 × 38 mm and is explicitly unrated. The rigid calibration cartridge is for a balance/fixture only.

R06 narrows the main housing to **73 × 56 × 38 mm**, with 10 mm plan-view front corner radii. It is 20% narrower than R05 and lies within the 62 mm collar width; the grip remains 46 mm diameter. Overall length with the reference filament stays 283.4 mm. The complete spring/magnet/sensor stage is shifted +7 mm in Y, while the cartridge receiver remains on Y=0. The connecting rod overlaps the centered receiver to transfer force. The front stop aperture follows the nose axis; its shoulder follows the shifted stage. The spring span, stock, axial station spacing and nominal Hall gap are unchanged. Moving mass, load offsets and enclosure stiffness can affect the real response, so R05 calibration cannot be assumed to transfer.

The rear lid posts are staggered in X to clear the leaf-screw tails. Front posts move forward and inward into the rounded corners. A shallow relief in the adaptor accommodates the Hall mount throughout its ±1 mm adjustment. The service-pin hole moves to Y=+7 mm; its temporary bridge changes with it. Existing hardware quantities and lengths remain the same.

## Preliminary spring estimate — not calibration

For two ideal fixed-guided rectangular leaves, the small-displacement estimate is:

`k_total = 2 E b t³ / L³`

Using E ≈ 110 GPa, b = 12 mm, t = 0.10 mm and L = 18 mm gives approximately **0.453 N/mm**, or **46.2 gf/mm**. The corresponding ideal travel is about **0.022 mm at 1 gf, 0.217 mm at 10 gf and 1.625 mm at 75 gf**. These values ignore carriage weight, clamp compliance, residual stress, finite-deflection effects and dimensional error. The beam approximation assumes little end rotation; the real assembled stage must be measured.

The simple peak bending-stress estimate is `3 E t δ / L²`, about **244 MPa at the 2.4 mm travel stop**. This is a sizing calculation, not a fatigue, yield or overload qualification. Thickness enters stiffness cubically, so small stock errors matter. Use documented spring-temper stock, not annealed copper. The [Copper Development Association C51000 data](https://alloys.copper.org/alloy/C51000) is the material reference; the delivered foil's properties must be confirmed with its supplier.

The prescribed clearance-check path includes an approximate lateral shortening `0.6 δ²/L`, reaching 0.192 mm at the compression stop. It is not an FEA result. No sensor resolution, clinical accuracy or repeatability is inferred from these equations.

The selected [DRV5055](https://www.ti.com/product/DRV5055) detects magnetic field. Its signal must be calibrated against force in the complete assembly; neither nominal magnet grade nor a nominal gap supplies an accurate transfer curve. Small polarity/position changes, nearby ferromagnetic materials and temperature can change that curve. The magnet and sensor are both mechanically retained/fixed before calibration.

## Checks performed

- `validation/geometry_build.json`: solid validity, closedness, one-solid structure and dimensions for every modeled object.
- `validation/export_validation.json`: every printable STL is closed, has one connected component, has no detected non-manifold edges or self-intersections, begins at Z≈0 and agrees with the STEP solid volume within 1%.
- `validation/assembly_checks.json`: zero unexpected static intersections; sampled carriage travel; prescribed flexed-leaf clearance; sensor adjustment clearance; deliberate interference just beyond both stops; service-pin engagement; cartridge unlock/withdrawal; collar rotation and head withdrawal.
- `validation/service_fixture.json`: temporary assembly-bridge clearance against the chassis, carriage, service pin and its mounting screws.
- Intentional screw/nut thread-envelope intersections are recorded separately. Real threads are not modeled.
- `validation/plate_validation.json`: neutral 3MF archive/XML integrity, millimetre units, nonoverlapping placements and a 180 × 180 mm layout envelope.
- `validation/revision_comparison.json`: exact retained-part geometry, housing width, centered cartridge, relocated stage and preserved spring spans/gaps checked against R05.
- CAD-derived previews were visually inspected. Cutaways/exploded offsets are presentation views only; the printable chassis has complete walls.

No physical print, slicer toolpath, printer settings, screw torque, stress analysis, magnet-field simulation, fatigue life, drop resistance, measured force accuracy or cleaning performance has been validated. The housing is not sealed. The clinical-contact consumable and vibration dome still need an appropriate validated hygiene approach.

## Editing and rebuilding

`cad/SoleSense_R06.FCStd` contains named editable solids and groups. It is not a fully constrained sketch/feature-history model. `source/build_model.py` is the reproducible construction source; dimensions and clearances are explicit there. A copy of the required R04 native input and two source STEP solids is in `source/dependencies/R04/`; the comparison baseline is in `source/dependencies/R05_review/`.

On the machine used for this package, run the FreeCAD bundled Python for `build_model.py`, `check_assembly.py`, `check_service_fixture.py`, `check_revision.py`, `validate_exports.py` and `package_plates.py`. Use background Blender for `render_review.py`. The saved native CAD remains usable without running the scripts. Review and recalibrate after any geometry, material, spring, magnet, sensor, fastening or wiring change.
