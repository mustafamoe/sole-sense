# SoleSense R03 — complete project package

**Current build:** [R07 sculpted magnetic pressure-head print package](revisions/R07/README.md). Begin with its fit coupons and build guide; the older R03 information below is retained for reference.

This ZIP brings the current R03 engineering design, print files, all review images, labeled component views and source documents together.

## View the design

- [Labeled exploded handle](previews/labeled/08_Exploded_handle_Labeled.png)
- [Labeled filament mechanism](previews/labeled/09_Exploded_filament_head_Labeled.png)
- [Labeled vibration head](previews/labeled/10_Exploded_vibration_head_Labeled.png)
- [Labeled head connector and wiring](previews/labeled/11_Swappable_head_connection_Labeled.png)
- [Complete component index](previews/labeled/COMPONENT_KEY.md), also provided as CSV and JSON in the same folder.

There are 20 review images: four original engineering views, eight additional angles/exploded views in `previews/expanded/`, and eight labeled sheets in `previews/labeled/`. P labels match printable STL filename numbers. The six fit coupons are listed separately from the 25 installed printed components.

## Open editable files

- FreeCAD: `cad/SoleSense_R03.FCStd`
- STEP: individual parts and both alternative complete assemblies in `cad/`
- Blender, labeled scenes: `cad/SoleSense_R03_Labeled_Views.blend`
- Blender, additional views: `cad/SoleSense_R03_Expanded_Views.blend`
- Blender, original review scenes: `cad/SoleSense_R03_Review.blend`

The labeled Blender file opens on the exploded handle. Use its scene selector to access the eight views. Each scene has an editable LABELS collection arranged for its saved camera.

## Print and assemble

1. Read [PETG printing and assembly](docs/assembly_and_printing.md), including the hardware quantities.
2. Start with `print_plates/01_Fit_coupons.3mf` and select your Bambu printer and actual PETG profile. The four 3MF files contain geometry, not sliced G-code.
3. Use the 31 individual files in `stl/` for printing. `reference/` holds assembly-position meshes and simplified hardware envelopes for design review.
4. Read the [selected hardware and design decisions](docs/decisions.md) and [wiring and head-exchange instructions](docs/wiring.md).

## Folder map

| Folder | Contents |
|---|---|
| `cad/` | Native FreeCAD, STEP parts/assemblies and three Blender review files |
| `stl/` | 31 printable parts, including six fit coupons |
| `print_plates/` | Four neutral 3MF geometry plates |
| `previews/` | All 20 renders and labeled component keys |
| `docs/` | Hardware decisions, assembly, PETG guidance and wiring |
| `source/` | Model, rendering, validation and packaging scripts plus parameters |
| `reference/` | Nominal hardware envelopes, assembly meshes and clearance references |
| `validation/` | Recorded CAD, mesh, movement, plate and labeling checks |
| `source_documents/` | User-supplied hardware PDF and original connector image |

The source documents record the original brief. Current component selections and design changes are in `docs/decisions.md`.

## Package verification

`PACKAGE_CONTENTS.json` lists every bundled project file. `PACKAGE_SHA256SUMS.txt` verifies the complete package; `SHA256SUMS.txt` preserves the earlier engineering-release checksums.

The design remains an engineering prototype. Physical module fit, print tolerances, electrical operation and complete-assembly force calibration require the checks described in the assembly notes.
