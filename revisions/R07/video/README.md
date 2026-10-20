# R07 magnetic pressure head — assembly and motion

[Watch the 60-second video](SoleSense_R07_Assembly_and_Motion.mp4) · [Editable Blender animation](SoleSense_R07_Assembly_and_Motion.blend)

This walkthrough uses the final R07 CAD export meshes. It shows an exploded parts overview, the main assembly stages, cartridge locking, a cutaway press/release cycle and an isolated view of the moving magnet beside the fixed Hall sensor. On-screen labels and synthetic English narration explain the sequence.

| Time | View |
| --- | --- |
| 00:00 | Complete head |
| 00:04 | Exploded enclosure, carriage, springs, magnet and sensor |
| 00:10 | Adaptor/chassis and magnet/carriage assembly |
| 00:17 | Temporary assembly bridge, service pin, leaves and sensor mount |
| 00:24 | Remove bridge, close enclosure, insert/lock cartridge, remove service pin |
| 00:35 | Cutaway: filament, carriage and springs during pressing/release |
| 00:44 | Isolated magnet and Hall sensor: changing separation |
| 00:54 | Complete head and next build steps |

## How to interpret the animation

- The enclosure, cartridge, carriage, magnet and Hall package use the R07 reference geometry in millimetres. The Hall package is an envelope, not a detailed manufacturer model.
- Exploded offsets and assembly paths are presentation choices. They are not collision-checked insertion paths or a detailed fastening tutorial. Nut seating, adhesive, wiring, tool access and screw tightening are simplified; follow the [build guide](../docs/BUILD_GUIDE.md) for actual assembly.
- The temporary bridge is removed before fitting the lid. The service pin is removed before every displayed sensing cycle. The pressure head is shown alone, without the handle or external electronics.
- In the cutaway, the cover and near wall are hidden. In the sensor close-up, the carriage, magnet retainer and fasteners are hidden so the magnet can be seen. These are display changes only; the printed parts remain complete.
- The prescribed stroke is **0–2.0 mm**, within the modeled 2.4 mm compression stop. Both leaves use a smooth fixed-guided bending shape over the 18 mm free span and the same approximate lateral shortening used in the CAD clearance checks. This is not FEA or a physical spring simulation.
- The reference filament translates with the cartridge. Filament bending/buckling and skin response are **not** simulated. The tan contact surface is only an explanatory loading cue.
- The approach bar indicates relative scripted displacement, not voltage or measured force. No magnetic field or Hall transfer curve is simulated. Force calibration and 1/10/75 gf accuracy remain unverified.
- Coral identifies the moving magnet; violet identifies the fixed Hall package. These are explanatory colors.

## Files and regeneration

- `SoleSense_R07_Assembly_and_Motion.mp4`: H.264, 1280 × 800, 24 fps, AAC narration, eight chapters. Rendered motion samples are held twice (12 samples/second).
- `SoleSense_R07_Assembly_and_Motion.blend`: editable baked transforms, visibility, leaf shape keys, camera and captions. No external texture dependencies.
- `source/build_animation.py`: imports the original CAD meshes and builds the animation.
- `source/encode_video.py`: creates macOS Samantha synthetic narration, encodes the MP4 and checks full decoding, duration, frames, audio and chapters.
- `source/storyboard.json`, `source/narration.json`: chapter timings and narration text.
- `motion_checks.json`, `baked_scene_checks.json`, `validation.json`: animation-specific checks; these do not qualify the physical design.
- `previews/`: chapter review frames.

On the authoring Mac:

```sh
/Applications/Blender.app/Contents/MacOS/Blender --background --factory-startup --python revisions/R07/video/source/build_animation.py -- --preview --render
python3 revisions/R07/video/source/encode_video.py
```

The scripts use the installed macOS Arial font and system voice, plus Homebrew FFmpeg. Raw frames and intermediate speech clips go to `/tmp`; they are not needed to play the video. The earlier R07 print/build ZIP is unchanged; this video is a separate addition.
