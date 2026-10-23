# R08 finer-finish print projects

Use these `_Fine.3mf` projects instead of the earlier 0.20 mm projects when surface finish matters. Prepared 21 October 2026 for an A1 mini, 0.4 mm nozzle, PLA Basic and Textured PEI plate. Match these assumptions to the physical machine and filament.

## One-plate head option

`SoleSense_R08_Complete_Head_14_Parts_A1mini_PLA_Fine.3mf` combines the 13 head/accessory pieces and cartridge receiver test coupon 53 on one plate. Included parts: 41, 42, 43, 44, 46, 47, 48, 49, 50, 51, 53, 55, 56 and 57. This is the pressure head print set, not the complete handheld device or vibration head.

The saved project was reopened and sliced in Bambu Studio 02.08.02.61 without displayed warnings. First-layer support spacing was visually inspected. Estimated total: **10 h 16 min, 123.50 g PLA, 529 layers**. The 0.12 mm profile, individual part settings, orientations and mesh dimensions are retained; only XY positions and in-plane rotations changed. The flexure retains 100% infill, slower walls, no supports, no brim and no ironing.

The larger hardware-fit coupon 52 is separate in `SoleSense_R08_Hardware_Coupon_A1mini_PLA_Fine.3mf`; this standalone coupon layout has not been re-sliced. It can also be printed from the validated small-parts project below. The two original split projects remain available for smaller batches and early fit checks.

`Complete_Head_14_Parts_layout.json` records the positions from the saved Bambu file. `compact_layout.json` and `../source/pack_fine_head.py` allow rebuilding the combined layout from the split fine projects. Rebuilding replaces the combined and standalone coupon files and requires fresh slicing.

## Changes

- Meshes re-exported from the exact R08 STEP solids with 0.01 mm linear / 0.04 rad angular tessellation tolerances (previously 0.04 mm / 0.12 rad). All 15 meshes are closed solids; maximum bounds difference is below 0.007 mm. CAD dimensions, assembly interfaces, orientation and plate spacing are retained.
- 0.12 mm normal layers, 0.24 mm first layer. The 2.4 mm flexure height remains an exact layer boundary.
- Outer walls 40 mm/s, inner walls 80 mm/s; top surfaces 35 mm/s. The flexure retains its slower 30/50 mm/s wall overrides.
- Outer-wall acceleration 1000 mm/s² and top-surface acceleration 800 mm/s²; 0.4 mm outer/top line width and 0.005 mm slicing resolution.
- 9 top layers, minimum 1.08 mm top thickness; 8 bottom layers. Four walls and existing infill overrides retained.
- Monotonic top surface pattern, seams biased toward the back of the plate.
- Ironing on flat top surfaces of lid 43, cartridges 48/49, bridge 55 and inlay 56: 30 mm/s, 10% flow, 0.15 mm spacing. No ironing on flexure 57 or fit coupons. Ironing is a starting profile and needs a physical sample to assess the actual filament.
- Existing supports retained. Tree structures and material visible within supported openings are removable support, not added CAD components.

The process preset may still be labelled `0.20mm Standard @BBL A1M` with an asterisk because it is the parent preset. The actual modified Layer height field is **0.12 mm**. The project records every changed setting so Bambu retains them on import.

## Validation and use

Both final projects were reopened, sliced and saved in Bambu Studio 02.08.02.61 without displayed slicing warnings:

| Project | Estimate | Filament | Layers |
| --- | --- | --- | --- |
| Small parts and fit checks | 2 h 17 min | 23.84 g | 176 |
| Main head parts | 8 h 44 min | 108.63 g | 529 |

The flexure's continuous beams were visually checked at the first layer (Z0.24) and final cassette layer 19 (Z2.40). The full preview range was restored, and the small-parts project was left open. These checks establish generated paths, not real print bond quality.

`mesh_validation.json` records solid-mesh and dimensional checks. Print the small-parts project first, then check hole/nut/magnet fits and the flexure before committing to the large enclosure. The slicer preview draws individual extrusion roads and seam markers; it is not a photographic prediction of the finished surface. Normal FDM layer texture will remain.

Assembly and calibration: [R08 build guide](../../../revisions/R08/docs/BUILD_GUIDE.md). Physical finish, fit, flexure fatigue and 1/10/75 gf measurement accuracy remain unvalidated. No physical print has been submitted.

Rebuild with `/Applications/FreeCAD.app/Contents/Resources/bin/python printing/R08/source/prepare_fine_finish.py` from the repository root; rebuilding replaces these generated files. Re-slice in Bambu Studio after rebuilding.
