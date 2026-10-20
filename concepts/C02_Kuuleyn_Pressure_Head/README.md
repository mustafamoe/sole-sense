# C02 — Kuuleyn 100 g pressure-head concept

A photo-based visualization of the Kuuleyn parallel-beam load cell inside the SoleSense pressure head. This is an editable 3D concept, not manufacturer CAD or a validated printable revision. R04 remains the current design.

[Cutaway](previews/01_Kuuleyn_Cutaway.png) · [Force path](previews/02_Force_Path.png) · [Isolated mechanism](previews/03_Kuuleyn_Mechanism.png) · [12-second animation](video/SoleSense_C02_Kuuleyn_Cutaway.mp4) · [Editable Blender model](cad/SoleSense_C02_Kuuleyn_Concept.blend)

## Proposed arrangement

The silver load cell runs across the head, perpendicular to the filament axis. Its wired end attaches to a fixed housing boss. A rigid blue bracket connects the other end to the floating cartridge receiver. Contact force travels from the filament through the cartridge and bracket into the beam, then into the housing at the fixed end.

The machined load-cell beam is itself the compliant sensing element. The additional circular flexure plates from C01 are omitted from this arrangement. The cell's strain gauges respond to its small deformation; an HX711 reader and calibration would convert the electrical signal to grams-force. The reader is not modeled here. Wire routes are schematic, not a pinout.

The cartridge remains accessible at the front. The visualization retains R04 cartridge and filament geometry, translated 15 mm forward. Its flange starts 2.4 mm ahead of the proposed housing nose, leaving 1.2 mm in the fully displaced demonstration pose. This prevents the illustrated flange from bottoming against the shell. It illustrates the removable cartridge position; its locking receiver and a service lock to protect the load cell during removal/insertion are not engineered here.

## Dimensions and limits

| Item | Visualization assumption |
| --- | --- |
| Load-cell bounding envelope | **47 × 12 × 6 mm — assumed, not verified** |
| Holes, slot, screws and gauge cover | Approximate reconstruction from product photographs |
| Proposed housing shoulder | 58 mm outside diameter |
| Nose extension relative to R04 | 13 mm |
| Animated displacement | Up to 1.2 mm, deliberately enlarged; not a safe stroke specification |

No reliable dimensioned manufacturer drawing was found. Measure the purchased part before changing manufacturing CAD. Confirm the actual load axis, mounting instructions and allowable moment from the offset bracket. This geometry is one possible arrangement rather than a confirmed fit.

The model uses prescribed motion, not mechanical simulation. No stiffness, stress, fatigue, printability or interference qualification is claimed. Overload stops, cartridge service locking, sealing, electrical layout and clearances require further design. Any stops must be set from the actual sensor's permitted travel; a travel stop does not limit force on the skin after it engages.

A nominal 100 g full-scale rating does not establish useful resolution or accuracy at 1 gf. Performance at 1, 10 and 75 gf must be demonstrated with whole-assembly calibration, including the bracket/cartridge dead weight, orientation, off-axis loads, wiring forces, temperature and reader noise. The reference filament has no calibrated buckling-force specification; selecting a force value on a screen would not change its physical buckling threshold. Force is measured in gf; pressure also requires the contact area.

## Source evidence

Reviewed 19 October 2026:

- [Kuuleyn UAE listing](https://www.carrefouruae.com/mafuae/en/bagless-vacuum/kuuleyn-load-cell-weight-sensor-load-cell-sensor-strain-gauge-0-to-100g-parallel-beam-electronic-load-scale-weighting-load-strain-gauges-100g-electronic-load-cell-scale/p/3233003000413): branded 0–100 g parallel-beam product; no dimensioned mounting drawing.
- [Kuuleyn product and photo gallery, ASIN B0B4SK7MWK](https://www.tiendamia.cr/p/amz/B0B4SK7MWK): silver beam, two relief holes connected by a slot, paired end mounting holes, white gauge protection, four wires and 100 g marking. Part identifier shown as Kuuleynhtfzc0s6ev.
- [Isometric product photograph](https://m.media-amazon.com/images/I/71ArzNk4QPL._SY800_.jpg) and [side photograph](https://m.media-amazon.com/images/I/518vBE0zwYL._SY800_.jpg): used for visual form, not dimensional measurement.
- [Phidgets Load Cell Guide](https://cdn.phidgets.com/docs/Load_Cell_Guide): general strain-gauge and single-point beam mounting principles. It is not a Kuuleyn specification.

## Files and verification

The Blender file includes the assembly, cutaway, labels, camera, lights, animation and concept notes. The source script rebuilds the model using the R04 reference meshes. No source media are required to open the packed Blender file. The video plays at 24 fps, with motion rendered at 12 samples per second and held for two frames.

Animation checks verify that the wired end stays fixed, the bracket and cartridge move together, and the model returns after release. Video checks verify frame count, dimensions and a full decode. Those checks do not establish physical performance.
