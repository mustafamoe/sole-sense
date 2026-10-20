# C03 — Four ways to sense force

Four narrated, captioned animations explain alternative sensing arrangements inside a SoleSense pressure head. Each shows the head cut open, a press, an isolated sensor close-up, and release. These are conceptual animations; R04 remains the current CAD design.

[Watch all four — 64 seconds](video/SoleSense_Four_Sensing_Designs.mp4)

| Video | What it illustrates | Separate video | Editable 3D scene |
| --- | --- | --- | --- |
| 1. Inline miniature load cell | The cartridge loads an S-beam; strain gauges detect its deformation. | [16 seconds](video/01_Inline_Load_Cell.mp4) | [Blender](cad/01_Inline_Load_Cell.blend) |
| 2. Magnetic flexure | A magnet moves with a flexure-supported holder above a stationary Hall sensor. | [16 seconds](video/02_Magnetic_Flexure.mp4) | [Blender](cad/02_Magnetic_Flexure.blend) |
| 3. Optical flexure | A moving flag progressively covers a light path between a fixed emitter and analogue detector. | [16 seconds](video/03_Optical_Flexure.mp4) | [Blender](cad/03_Optical_Flexure.blend) |
| 4. Capacitive sensor | A load-spreading pad presses a thin sensing stack against rigid backing. An enlarged layer diagram explains the principle. | [16 seconds](video/04_Capacitive_Sensor.mp4) | [Blender](cad/04_Capacitive_Sensor.blend) |

Combined-video chapters start at **0:00**, **0:16**, **0:32**, and **0:48**. The files include synthetic English narration generated with the installed macOS Samantha voice, plus captions visible in the image. There is no music. Each file is H.264, 1440 × 900, 24 fps, with AAC narration. Motion is rendered at 12 samples per second and held for two playback frames.

## What the colors mean

Gold is the replaceable cartridge and reference filament. Blue parts move with the cartridge. Dark teal parts attach to the housing. The magnetic and optical versions use teal metal flexures. Purple denotes sensing elements; red patches on the S-beam represent strain gauges. Signal bars show qualitative changes only, never a measured force value.

The original R04 cartridge and filament reference meshes are retained, translated 15 mm forward in this illustrative head. The common housing has a proposed 58 mm shoulder diameter and a nose 13 mm farther forward than R04. The cartridge flange begins 2.4 mm clear of the nose. The camera-facing upper shell is cut away while some lower shell remains to show fixed mounting supports.

## Engineering boundaries

- **No accuracy claim:** 1, 10 and 75 gf are intended measurement targets, not demonstrated performance. The videos do not calculate stress, force, sensitivity, resolution or uncertainty. The colored signal bars are explanatory graphics.
- **Motion is enlarged and prescribed:** the inline mechanism moves by up to 0.7 mm, magnetic and optical holders by 1.2 mm, and the whole-head capacitive stack by 0.06 mm. These values are visualization choices, not operating travel or safe sensor-deflection limits.
- **Parts are schematic:** the S-beam uses an approximately 19.1 × 6.7 × 17.5 mm envelope; its slots, gauges and mounting faces are not manufacturer CAD. Magnetic/optical components and flexures are custom illustrations with no selected part numbers. The capacitive head uses an 8 mm diameter, 0.30 mm thick illustrative disk; its separate enlarged layer diagram is not the internal construction of a particular product.
- **Different measurement paths:** the load cell senses strain. Magnetic and optical versions infer force from calibrated flexure movement. The capacitive version measures a change in the sensor stack under load. Each needs electronics and calibration of the complete assembly.
- **Remaining mechanical work:** service locking for cartridge exchange, overload protection, retention, wiring, hygiene sealing, side loads, gravity/orientation, fatigue, tolerances and assembly access remain unresolved. The capacitive guide rings show axial clearance only; friction, preload and retention require engineering. Additional support forces must be included in calibration.
- **Filament behavior:** the retained nylon is an uncalibrated geometry reference. A single filament is not automatically capable of transmitting every target force. Buckling, contact geometry and the intended test must be considered separately.

## Sources informing the concepts

- [FUTEK LSB200 miniature low-capacity load-cell family](https://www.futek.com/store/load-cells/s-beam-load-cells/miniature-s-beam-lsb200/pb00155): compact S-beam architecture and published envelope. The scene is an illustrative adaptation, not a manufacturer model.
- [Texas Instruments: tracking displacement with linear Hall-effect sensors](https://www.ti.com/document-viewer/lit/html/SBAA513): non-contact magnetic position measurement. The force mapping is a proposed calibration of the custom flexures.
- [Research on LED-based displacement force sensing](https://arxiv.org/abs/2410.03481): optical displacement as a force-sensing approach. The analogue flag geometry in this video is a separate concept, not a reproduction of the paper's sensor.
- [SingleTact standard capacitive sensors](https://www.singletact.com/micro-force-sensors/standard-sensors/) and [performance specifications](https://www.uk.singletact.com/micro-force-sensor/singletact-electronics/p/selection-wizard): thin 8 mm / 1 N sensor option and relevant limits. Full-scale range does not establish accuracy at 1 gf.
- [North Coast Medical monofilaments](https://www.ncmedical.com/products/touch-test-sensory-evaluators_1278.html): a monofilament's bending threshold is tied to its target force.

## Verification and regeneration

`video/motion_checks.json` records fixed-anchor, coordinated-motion, return-to-rest, selected capacitor-layer interface, and cartridge-flange clearance checks. These are checks of the animation, not a physical design qualification. `video/validation.json` records each video's dimensions, duration, frame count, audio presence and complete decoding.

`source/build_alternative.py` creates each scene using `--mode inline`, `magnetic`, `optical` or `capacitive`, with `--preview` for stills. `source/render_videos.py` renders their motion. `source/create_narration.py` generates local narration; `source/encode_videos.py` produces the separate videos and chaptered comparison reel. Fonts are packed into the Blender scenes.
