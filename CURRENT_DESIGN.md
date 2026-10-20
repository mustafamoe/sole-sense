# Current design work

The current design is **[R08 — replaceable printed flexure](revisions/R08/README.md)**. One flat printed cassette replaces the two metal leaves and four clamps. The curved outer form, magnet, Hall mount, manual cartridge and larger display geometry remain.

[Inside R08](revisions/R08/previews/02_Inside_Head.png) · [Exploded cassette](revisions/R08/previews/03_Exploded_Cassette.png) · [Native CAD](revisions/R08/cad/SoleSense_R08.FCStd) · [Print/build ZIP](revisions/SoleSense_R08_Print_and_Build.zip) · [Updated head shopping list](revisions/R08/docs/SHOPPING_LIST.md)

Use R08 chassis 42, carriage 44, bridge 55 and one cassette 57/58/59. Four M2 × 8 screws replace the eight old leaf-clamp screws. Real magnet, sensor, conductors and other fasteners remain. Stops are 2.0 mm compression / 0.6 mm extension. CAD checks pass; physical fit, force accuracy, printed-spring drift and fatigue remain untested. The R07 video shows the previous mechanism.


The preceding design is **[R07 — sculpted magnetic pressure head](revisions/R07/README.md)**. The head has a curved white cover, tapered nose, teal inlay, softer edges and concealed underside cover screws. Its mechanism and centered filament retain R06 geometry.

[See the design](revisions/R07/previews/00_Design_Hero.png) · [Open R07 CAD](revisions/R07/cad/SoleSense_R07.FCStd) · [Print/build ZIP](revisions/SoleSense_R07_Print_and_Build.zip) · [Updated parts list](revisions/R07/docs/SHOPPING_LIST.md)

Use R07 parts 41, 42, 43 and 55 together. Order four M3 × 35 cover screws, one M3 × 30 service screw, and 14 M3 nuts in total. Inlay 56 is optional. This is a CAD-checked first-fit prototype; physical printing and force calibration remain required.


The preceding design is **[R06 — slimmer magnetic pressure head](revisions/R06/README.md)**, dated 20 October 2026. The head is now **56 mm wide instead of 70 mm**, with rounded front corners and a centered filament. It is narrower than the 62 mm collar; the 46 mm grip and larger display are retained.

[Before and after](revisions/R06/previews/04_Before_After.png) · [Open R06 CAD](revisions/R06/cad/SoleSense_R06.FCStd) · [Print/build ZIP](revisions/SoleSense_R06_Print_and_Build.zip) · [Build guide](revisions/R06/docs/BUILD_GUIDE.md)

Use R06 adaptor 41, chassis 42, lid 43, carriage 44 and assembly bridge 55 together. The springs, sensor, magnet and fastener order remain the same. CAD movement and mesh checks pass; physical print fit and force calibration remain to be done. Earlier built-in electrical contacts remain an unfinished concept.


The previous build package is **[SoleSense R05 — magnetic pressure head](revisions/R05/README.md)**, dated 20 October 2026. It contains a clamped phosphor-bronze leaf stage, DRV5055 Hall mount, retained disc magnet, travel stops, cartridge/service locks, fit coupons and six geometry-only print plates. [Start with the build guide](revisions/R05/docs/BUILD_GUIDE.md) and [parts list](revisions/R05/docs/SHOPPING_LIST.md).

[Open R05 CAD](revisions/R05/cad/SoleSense_R05.FCStd) · [View inside the head](revisions/R05/previews/02_Inside_Head.png) · [Print-first plate](revisions/R05/print_plates/01_Print_First.3mf)

R05 is a first-build bench prototype with checked CAD geometry, not physically validated force measurement. The mechanical R04 head joint and larger display are retained. Initial sensing uses external bench electronics through a new cable exit; the earlier built-in electrical contacts remain an unfinished concept. The original revisions below are preserved.

The 19 October 2026 design iteration is [SoleSense R04](revisions/R04/README.md): interchangeable pressure/vibration heads, a manual single-filament cartridge, a stationary electrical contact concept with a rotating locking collar, and a larger 1.3-inch display.

[Open the new CAD](revisions/R04/cad/SoleSense_R04.FCStd) · [View the design](revisions/R04/previews/01_Assembly.png) · [Read the design review](revisions/R04/docs/DESIGN_REVIEW.md)

R04 is a review prototype, with unselected contact hardware and unvalidated force/hygiene behavior. The original R03 release files and their checksums remain unchanged.

Animated walkthrough: [head swaps, cartridge replacement and operation](revisions/R04/video/SoleSense_R04_Showcase.mp4).

Separate concept study: [C01 flexure-guided pressure head](concepts/C01_Flexure_Pressure_Head/README.md), with a cutaway and animated explanation. This explores a floating cartridge holder and force-sensor location; it is not a validated CAD revision.

Latest sensor-specific study: [C02 Kuuleyn 100 g pressure head](concepts/C02_Kuuleyn_Pressure_Head/README.md), with a photo-based beam model, longer housing, cutaway and press/release animation. The load cell itself provides compliance. Sensor dimensions and physical performance are not yet verified.

Comparison videos: [C03 four sensing alternatives](concepts/C03_Sensing_Alternatives/README.md) explains an inline miniature load cell, magnetic flexure, optical flexure and thin capacitive sensor. Four narrated 16-second videos and a 64-second comparison reel show conceptual operation; they do not establish fit or 1/10/75 gf accuracy.
