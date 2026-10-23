# R08 head: lower-support print orientations

Use `SoleSense_R08_Head_14_Parts_Lower_Support_A1mini_PLA_Fine.3mf` for the revised 14-piece head plate. Prepared and sliced in Bambu Studio 02.08.02.61 on 21 October 2026. A1 mini, 0.4 mm nozzle, PLA Basic, Textured PEI, 0.12 mm normal layers and 0.24 mm first layer.

| Bambu estimate | Previous packed plate | Revised plate |
| --- | ---: | ---: |
| Total time | 10 h 16 min | 9 h 56 min |
| Total filament | 123.50 g | 121.20 g |
| Support filament | 9.29 g | 7.03 g |
| Layers | 529 | 291 |

Support filament is reduced by about 24%. Total material is reduced by about 1.9%; most of the material belongs to the parts themselves. The geometry and scale are unchanged.

## What changed

- Carriage 44 lies horizontally, reducing its height from 63.6 mm to about 30 mm. Its two cassette mounting faces point upward, clear of support contact. The rod, shoulder undersides, receiver opening and other overhangs still require accessible supports. Inspect and clear the cartridge tracks after printing.
- Hall mount 47 lies on its side with the sensor opening facing up. Its height drops from 20 mm to 10 mm. Some shallow support remains beneath the offset post.
- All 14 pieces were repacked with clearance for generated supports. Every object's lowest point is on Z=0; no whole part is suspended above the bed.
- Chassis 42 stays open upward, lid 43 crown upward, and cartridges retain their original orientation. Alternative flips increased support or offered worse contact/fit surfaces. Flexure 57 remains flat, solid, with no support, no brim and no ironing. Other fine-finish settings are retained.

Several connected parts contain raised features that cannot all touch the bed together. Removing the remaining support would require changes to the geometry or splitting parts, rather than simply lowering them into the bed.

## Checks and files

The final project displayed **Slice ok** without collision warnings. Its first-layer preview was inspected, including separation between support footprints and the continuous flexure beams. All 14 objects are printable, grounded within 0.001 mm, inside the 180 mm plate, and use rotations/translations without scaling. See `validation/final_checks.json`. These are slicer and geometry checks; physical fit, finish and mechanism performance still need a test print. No print job was sent.

The 14 pieces are parts 41, 42, 43, 44, 46, 47, 48, 49, 50, 51, 53, 55, 56 and 57: 13 head/accessory pieces plus cartridge receiver test coupon 53. Hardware coupon 52 remains separate in `../fine_finish/`. Purchased hardware, magnet, sensor and filament are not printable parts.

`optimized_layout_spec.json` records the rotations and centers. Rebuild using `python3 printing/R08/source/optimize_orientation.py printing/R08/orientation_optimized/optimized_layout_spec.json printing/R08/orientation_optimized/SoleSense_R08_Head_14_Parts_Lower_Support_A1mini_PLA_Fine.3mf` from the repository root. This overwrites the generated project; re-slice afterward. The original packed project in `../fine_finish/` is preserved.

The orientation comparison JSON files and per-candidate result files in `validation/` record the alternatives tested. Individual-part times include their own heating/cooling effects, so the full-plate comparison above is the meaningful job estimate.

Assembly: [R08 build guide](../../../revisions/R08/docs/BUILD_GUIDE.md). Its original nose-down carriage printing advice is superseded only for this optimized project; the assembly geometry and instructions are unchanged.
