# Current design work

The current design is **[R08 — replaceable printed flexure](revisions/R08/README.md)**. One flat printed cassette replaces the two metal leaves and four clamps. The curved outer form, magnet, Hall mount, manual cartridge and larger display geometry remain.

After printing: [R08 assembly video](output/video/SoleSense_R08_Assembly_Guide.mp4) · [Illustrated assembly PDF](output/pdf/SoleSense_R08_Head_Assembly_Guide.pdf) · [Guide notes and sources](guides/R08-head-assembly/README.md).

[Inside R08](revisions/R08/previews/02_Inside_Head.png) · [Exploded cassette](revisions/R08/previews/03_Exploded_Cassette.png) · [Native CAD](revisions/R08/cad/SoleSense_R08.FCStd) · [Print/build ZIP](revisions/SoleSense_R08_Print_and_Build.zip) · [Updated head shopping list](revisions/R08/docs/SHOPPING_LIST.md)

Use R08 chassis 42, carriage 44, bridge 55 and one cassette 57/58/59. Four M2 × 8 screws replace the eight old leaf-clamp screws. Real magnet, sensor, conductors and other fasteners remain. Stops are 2.0 mm compression / 0.6 mm extension. CAD checks pass; physical fit, force accuracy, printed-spring drift and fatigue remain untested.


R08 is the only standalone device revision in this working tree. Previous revisions and concept studies are available in Git history. Keep the bundled source dependencies under `revisions/R08/source/dependencies/`: R08 uses them to rebuild retained components and compare geometry.

Prepared printing work: [R08 print projects](printing/R08/README.md) · [Optimized head orientations](printing/R08/orientation_optimized/README.md) · [Replacement-part plate](printing/R08/reprint_skipped/README.md).
