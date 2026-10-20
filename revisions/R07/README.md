# SoleSense R07 — sculpted magnetic head

20 October 2026 · First-fit bench prototype

![Sculpted enclosure](previews/00_Design_Hero.png)

R07 replaces the flat, exposed-screw cover with a **curved white hood, a slim teal inlay, a tapered nose, a blended neck and concealed underside fasteners**. The main housing stays 56 mm wide. Its cover is taller to form the curved shoulders; the housing is 76 × 56 × 44 mm. The filament remains centered and the overall length stays 283.4 mm with the reference nylon.

The R06 spring stage, carriage, Hall sensor, magnet, cartridge and mechanical head joint retain their geometry. The top opens for service. The cover is secured by four **M3 × 35 screws from underneath**; the removable service pin is now **M3 × 30**. Two extra M3 nuts are needed for the revised assembly bridge. Use the updated parts list.

**Start with the [build guide](docs/BUILD_GUIDE.md) and [R07 parts list](docs/SHOPPING_LIST.md).** Reprint parts **41, 42, 43 and 55** as a matched set. Inlay 56 is optional. Fit a new M3 × 30 screw to the service knob; an existing knob can be reused only if it can be detached intact from its old screw.

- [Before and after](previews/04_Before_After.png)
- [Assembled view](previews/01_Assembled.png)
- [Inside the head](previews/02_Inside_Head.png)
- [Assembly and cartridge service](previews/03_Assembly_Service.png)
- [Native FreeCAD model](cad/SoleSense_R07.FCStd)
- [Magnetic-head STEP assembly](cad/SoleSense_R07_Magnetic_Head_Assembly.step)
- [Full pressure-device STEP assembly](cad/SoleSense_R07_Pressure_Assembly.step)
- [Editable Blender review](cad/SoleSense_R07_Review.blend)
- [Print-first plate](print_plates/01_Print_First.3mf)
- [Design changes and dimensions](docs/R07_CHANGES.md)
- [Wiring and calibration](docs/WIRING_AND_CALIBRATION.md)
- [Engineering assumptions and checks](docs/ENGINEERING_NOTES.md)

There are 37 individual printable STLs and six geometry-only 3MF plates. Plates 01–03 cover the head, coupons and accessories; 04–06 contain retained handle/vibration parts. Select the actual printer/material profile and review supports. Print the white shell and teal inlay separately; no multi-material printer is required. White/teal is a color choice, not a material qualification.

CAD movement, solid, mesh and exchange checks pass. Physical printing, calibration at 1/10/75 gf, fatigue and hygiene validation remain outstanding. The nylon is an unrated layout reference. Initial sensing still uses external bench electronics through the cable exit; the earlier built-in electrical contact concept remains unfinished. This is a first-fit prototype, not a patient-use release.

R03–R06 are preserved. Reproducible source includes the R04 construction inputs and R06 comparison baseline.
