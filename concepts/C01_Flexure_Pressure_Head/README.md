# SoleSense C01 — flexure pressure-head concept

An explanatory cutaway and motion study based on the existing R04 pressure-head shell and replaceable filament cartridge. C01 is a separate concept study, not a replacement CAD release. R04 remains the current design.

- [Play the 16-second animation](video/SoleSense_C01_Flexure_Cutaway.mp4)
- [Labeled cutaway](previews/01_Cutaway.png)
- [Pressed state](previews/02_Pressed.png)
- [Flexure close-up](previews/03_Flexure_Closeup.png)
- [Editable Blender scene](cad/SoleSense_C01_Flexure_Concept.blend)

## What the colours mean

| Colour | Component | Function |
|---|---|---|
| Grey | Head shell and mounts | Remain fixed relative to the handle. The front half is removed only to reveal the interior. |
| Dark teal | Outer support rings | Attach the flexible plates to the head. |
| Bright teal | Thin curved metal leaves | Bend elastically to guide small axial motion and return the holder when contact is removed. |
| Blue | Floating cartridge receiver and stem | Carry the removable cartridge and transfer axial loading toward the sensor. |
| Gold | R04 cartridge and nylon reference | Replace together; current filament geometry has no calibrated force rating. |
| Purple | Generic force-sensor envelope | Indicates a possible sensing location, not a selected or dimensionally verified component. |

Two spaced flexure plates support the moving receiver. Contact pushes the filament and receiver backward, the curved leaves bend out of their planes, and the central stem loads the sensor. On release the leaves recover. The final close-up hides the shell, sensor and cartridge to reveal the two plates.

The visual shows the contact surface approaching a stationary head; in use, a person would normally move the handle toward the skin. The pink slab is only a schematic contact surface. The filament is kept straight to isolate the new mechanism's motion; real filament buckling is not simulated.

## Engineering boundaries

- This is a prescribed-motion illustration, not finite-element analysis or a tested prototype. The 1.8 mm displayed travel is enlarged for explanation and is not a specification for real sensor travel.
- The existing rigid R04 socket would need to become a floating receiver. Sensor selection, mechanical fit, stiffness, stress, fatigue, allowable travel, tolerances and overtravel-stop clearance remain unresolved. No printable production geometry is released in this concept.
- The housing-mounted flexures and rear sensor form **parallel load paths**. In static axial equilibrium, tip force includes sensor reaction **plus flexure restoring force**, as well as gravity and other relevant loads. Calibrating a bare load cell alone will not calibrate this assembled head. No accuracy at 1, 10 or 75 gf is established.
- The purple box is an unselected sensing envelope; it is **not** a model of the Phidgets 3139 or FUTEK FSH03870. It must be replaced with the chosen component's actual geometry and mounting arrangement.
- A cartridge-change anti-rotation feature must carry the twist-lock torque without overstressing the thin leaves. The current visual receiver is a packaging envelope, not a complete bayonet-retention design.
- The small grey blocks illustrate mechanical travel stops. Stops can protect the mechanism, but do not limit force on skin after bottoming out.
- A cleanable barrier, sealing, electrical connections, wire forces, zeroing and orientation/gravity compensation remain to be designed. Clinical performance is not established.

The flexure mechanism principle is described in the [BYU introduction to compliant mechanisms](https://llhwww.groups.et.byu.net/intro/intro.html) and [Howell's introduction in the Handbook of Compliant Mechanisms](https://onlinelibrary.wiley.com/doi/10.1002/9781118516485.ch1). The proposed SoleSense arrangement is a design concept developed here, not a validated design from those sources.

## Reproduction

The source `source/build_cutaway.py` runs inside Blender 5.1.2 and imports the existing R04 STL references. Pass `-- --preview` to render the three annotated stills. The saved Blender scene contains 384 animation frames at 24 fps; render them to PNG and encode with `source/encode_video.py`.
