# R08 head assembly guide

For the completed 14-part R08 head print set, including the 42/47/49/53 reprint. Prepared 22 October 2026 from the released R08 CAD and build instructions.

- [1080p narrated video, 4:43](../../output/video/SoleSense_R08_Assembly_Guide.mp4)
- [Printable assembly guide, 18 pages](../../output/pdf/SoleSense_R08_Head_Assembly_Guide.pdf)
- [English captions](../../output/video/SoleSense_R08_Assembly_Guide.srt)
- [Timed narration transcript](TRANSCRIPT.md)

The video has 14 chapter markers, 24 fps assembly motion, synthetic English narration and selectable captions. There is no music. The PDF matches the video steps and adds hidden nut views, wiring, troubleshooting and calibration handoff notes. Colours distinguish components; they need not match the printed filament.

## Scope

The head uses one printed cassette, part 57 (or alternative 58/59). This guide does not use the previous metal-spring mechanism. It covers the pressure head only, not handle electronics or the vibration head.

Illustrations import actual R08 assembly meshes. Exploded offsets clarify assembly order; fasteners are simplified CAD envelopes, sensor geometry is a package envelope, and the wire route is illustrative. These views do not establish physical print fit, insertion collision clearance, force accuracy or fatigue life. The final bench checks and calibration still need to be performed on the real assembly.

## Source and reproducibility

- `source/content.py`: the shared instructions and narration.
- `source/render_geometry.py`: Blender geometry renders and reference scene.
- `source/layout.py`: common image/video layout and part inventory.
- `source/build_audio.py`: sentence-timed macOS Samantha narration and captions.
- `source/encode_video.py`: 1080p H.264/AAC export, subtitles, chapters and full decode check.
- `source/build_pdf.py`: searchable instructions and illustrated landscape A4 PDF.
- `source/source_manifest.json`: local reference paths and SHA-256 hashes.
- `validation_video.json` and `validation_pdf.json`: output checks.

The `.blend` is a reference scene. The Python script supplies the staged animation poses; animation is not baked into that scene.

To regenerate on this Mac, run from the repository root:

```sh
/Applications/Blender.app/Contents/MacOS/Blender -b -t 6 --python guides/R08-head-assembly/source/render_geometry.py -- --preview
/Applications/Blender.app/Contents/MacOS/Blender -b -t 6 --python guides/R08-head-assembly/source/render_geometry.py -- --render
python3 guides/R08-head-assembly/source/build_audio.py
python3 guides/R08-head-assembly/source/encode_video.py
/Users/mustafamoe/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 guides/R08-head-assembly/source/build_pdf.py
```

Blender 5.1.2, FFmpeg, Pillow, ReportLab, pypdf, Arial fonts and the macOS Samantha voice were used. The PDF runtime path above is machine-specific. Rendering caches are disposable; the scripts recreate them. If narration text changes, clear `assets/audio/` before rebuilding speech. The released CAD and print projects are not modified.
