# SoleSense R04 — review of the manual-cartridge design

19 October 2026. Mechanical review prototype, derived from R03. R03 files are preserved.

## Design recommendation

Use one exposed monofilament, permanently fixed into a small replaceable cartridge. The operator handles the cartridge flange, without touching or threading the filament. Change the whole cartridge when changing the contact part or the force grade. The pressure head stays attached during cartridge changes.

This separates two operations:

1. **Change modality:** exchange the complete pressure or vibration head at the handle.
2. **Change the contact part:** exchange only the filament cartridge in the pressure head.

An internal filament would leave the rounded probe tip as the shared skin-contact surface. Replacing only the hidden filament would not solve that hygiene concern. R04 removes that rounded tip, its sliding guide and the three-position servo mechanism.

The intended hygiene workflow is a preassembled cartridge replaced between patients, plus an appropriate validated cleaning procedure for the reusable device. This is a design intention, not a demonstrated single-use or sterile product. The printed hub, nylon, adhesive, handling, packaging and cleaning process require assessment before patient use. The vibration dome remains reusable and needs its own validated cleaning or replaceable contact-surface solution.

Commercial replacement monofilaments demonstrate the general replaceable-filament approach: [Owen Mumford replacement monofilaments](https://www.owenmumford.com/us/neuropen-monofilaments). They are not claimed to fit this new cartridge. A manufacturer's explanation of [monofilament force](https://baileyinstruments.co.uk/products/duraban-retractable-monofilament-10g) identifies free length, diameter and material properties as relevant. Consequently, field trimming or changing an arbitrary piece of filament is not the proposed user workflow.

## What changed

| Feature | R03 | R04 concept |
|---|---|---|
| Head exchange | Two retention screws plus a separate six-wire plug | Sliding safety lock, 30° collar rotation, straight withdrawal |
| Electrical joint | Manually unplugged Micro-Fit | Four stationary spring-contact/pad reserves; exact hardware unselected |
| Pressure mechanism | Servo, three-position carrier, internal nylon, sliding rounded tip and optical travel sensor | One passive external filament cartridge |
| Filament replacement | Open head, remove retainer screws | Grip flange, twist 30°, withdraw cartridge |
| Pressure configuration length | 270.3 mm | 224.4 mm with the 38 mm reference filament |
| Vibration configuration length | 185.3 mm | 185.3 mm |
| Grip | Ø46 mm | Ø46 mm |
| Locking collar | None | Ø62 mm main ring, with small fastener pads beyond the circular outline |
| Display | 0.96-inch, 27 × 27 × 5 mm envelope | 1.3-inch, 35.6 × 33 × 6.2 mm envelope |
| Viewing aperture | 23 × 12.5 mm | 30.4 × 15.8 mm, about 67% more aperture area |

The new display is still a 128 × 64 monochrome class display. Bigger physical text does not imply more pixels. The reference footprint is [Adafruit 938](https://www.adafruit.com/product/938), whose published active area is 29.42 × 14.70 mm. The model uses a centered active-area assumption, a foam/adhesive rear frame, and headerless wiring. Check the actual glass position, underside components and cable bend space against the purchased module before finalizing the pod. The preview screen is an illustrative mockup, not implemented firmware.

## Head connection

The **head does not rotate**. Its pilot and key locate it in the handle, while a separate collar rotates around the stationary joint. This keeps the proposed contact pads and pins aligned and avoids twisting wires.

For the prototype exchange sequence:

1. Switch power off.
2. Pull the top safety slider toward the heel by 5 mm.
3. Turn the collar 30° to align its entry slots with the head lugs.
4. Pull the head straight out. The proposed electrical contacts separate with it.
5. Align the replacement head's key, insert fully, turn the collar to its stop, and push the safety slider forward.
6. Confirm mechanical retention before restoring power.

The slider has no spring and does not automatically relock. Its travel is intended to be retained by an M2 shoulder screw; actual shoulder height, washer arrangement and tactile feel require bench fitting. The two collar halves use two M2 through bolts and nuts, with their axes at X151.5 / Z±29. This lets the collar be installed around the fixed shoulders. These bolts are assembly fasteners, not part of everyday head changes. Bolt length and bearing area need physical verification.

Contact assignment is a **proposal**: ground, regulated supply, motor control and head ID. The pressure head could use a passive ID resistor; the vibration head uses the retained motor-driver space. No ID circuit, firmware, power sequencing or production PCB has been implemented. The gold contacts are nominal clearance envelopes, not manufacturer CAD. Working stroke, preload, current rating, plating, wear and ingress protection remain open. Do not interpret this as a validated hot-swap interface.

## Filament cartridge

The illustrated cartridge has a roughly 21 mm grip flange, a 9.9 mm stem, two short bayonet lugs and a 1.3 mm potting bore. Its flange fixes the filament exit plane. The 38 mm free length and Ø0.9 mm nylon cylinder are **layout references only**. No 1, 10 or 75 gf output is assigned to this geometry. This is monofilament material, not 3D-printer feedstock.

The user should eventually receive a prepared, identified and verified cartridge, rather than cut and pot nylon during use. Different calibrated grades can share the hub interface. Cartridge force labeling should follow measurement, not precede it.

The cartridge bayonet has geometric retention against straight withdrawal. A positive detent, repeatable seating/preload, wear life and removal torque still need development and testing. The separate storage cover is a loose clearance concept; it is not a sterile barrier or validated retention fit.

The pressure head is manually applied. R04 removes servo indexing and the optical tip-travel sensor. It does **not** measure applied force or automatically detect contact/buckling. If automatic timing or force confirmation is required, that is a further design requirement; it cannot be inferred from the screen or retained button.

## CAD verification and limits

`../validation/cad_validation.json` records solid validity, assembled intersections, sampled motion and deliberate geometric stop checks. `../validation/export_validation.json` records STEP/STL validity, closedness, connected components, non-manifold edges, self-intersections and mesh-to-solid volume agreement.

The motion checks include slider travel, both collar/head configurations, head withdrawal, cartridge rotation and cartridge withdrawal. Deliberate interference checks confirm that a locked collar blocks axial head withdrawal, the engaged slider blocks collar rotation, and the handle shoulders capture the collar axially. Those are geometry checks, not load tests or a continuous-motion proof.

The next physical checks are the joint coupons, collar/slider operation, actual display fit, selected electrical contacts and the complete filament cartridge's force and hygiene behavior. The current geometry is suitable for design review and controlled bench-fit development. It is not a manufacturing or clinical release. No sealing, cleaning compatibility, electrical operation or patient-contact suitability has been established.

## Files and editability

- `../cad/SoleSense_R04.FCStd`: native solids with named groups. Opens with the pressure configuration visible; show `Vibration_head` and hide `Pressure_head` to compare. Fit coupons and accessories start hidden.
- `../cad/SoleSense_R04_Pressure_head_Assembly.step` and `../cad/SoleSense_R04_Vibration_head_Assembly.step`: separate mechanical assemblies, millimetres. Do not print an entire assembly as one object.
- `../cad/SoleSense_R04_Review.blend`: five editable review scenes built from the exported CAD meshes.
- `../stl/`: individual part meshes, normalized to Z=0. Orientation is a starting point, not a validated support plan; there is no sliced G-code or approved print profile.
- `../source/build_model.py`: reproducible FreeCAD construction using the original R03 source solids. Dimensions are explicit in the script; the native file is not a constrained sketch-based feature tree.
- `../source/render_review.py`: review views. Colors and screen text are illustrative.

Rebuild from the repository root with the same FreeCAD Python and Blender runtimes described in the R03 README, substituting the scripts in `revisions/R04/source/`. Keep the original `cad/` and `source/assembly_manifest.json` alongside this revision because the builder reuses those verified source solids.
