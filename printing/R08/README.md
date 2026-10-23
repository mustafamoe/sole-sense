# R08 Bambu Studio print projects

**Updated 21 October:** use the improved projects in [fine_finish](fine_finish/README.md) for the requested finer surface finish. The two 0.20 mm files below are retained as the earlier baseline.

**Latest combined plate:** [lower-support orientations](orientation_optimized/README.md) keep all 14 pieces and the 0.12 mm profile, with the carriage and Hall mount reoriented. Bambu estimates 9 h 56 min / 121.20 g, including 7.03 g of support.

Prepared and sliced in Bambu Studio 02.08.02.61 on 20 October 2026.

Printer preset: Bambu Lab A1 mini, 0.4 mm standard nozzle, Textured PEI plate, Bambu PLA Basic. Confirm these match the physical printer and loaded filament before printing. Geometry remains at 100% scale in millimetres.

## Print order

1. **SoleSense_R08_02_Head_Small_and_Fit_Checks_A1mini_PLA.3mf** — 11 objects: small head parts, baseline 0.8 mm flexure cassette, hardware and cartridge receiver fit coupons. Estimated **1 h 8 min / 23.13 g**. Start here; check screw/nut/magnet fits and cartridge fit before the large parts.
2. **SoleSense_R08_01_Head_Large_A1mini_PLA.3mf** — chassis, lid, joint adaptor and moving carriage. Estimated **3 h 47 min / 105.48 g**.

Both final layouts sliced successfully without a displayed collision warning. The earlier combined layout produced support-path conflicts and is retained only in `setup_drafts`; do not print those draft layouts.

## Settings

0.20 mm layers, 4 walls, 5 top/bottom layers, 40% infill for shells. Solid infill overrides for carriage, cartridges, retainer, knobs, bridge and flexure. Automatic tree supports enabled where applicable, including supports starting on the model. Auto brim on ordinary parts.

The cassette is flat, with supports off, no brim, 100% fill, outer walls 30 mm/s and inner walls 50 mm/s. Both beams are present with continuous paths in the inspected first-layer and 2.0 mm previews. Physical bond quality, fatigue, fit and force calibration remain untested.

These are editable projects with geometry and settings, not exported printer G-code. Re-slice after reopening or changing settings. No physical print was sent. Allow supports to cool before careful removal, particularly around the carriage. See ../../revisions/R08/docs/BUILD_GUIDE.md for assembly and calibration; the head is a bench prototype and the 1/10/75 gf performance has not been validated.
