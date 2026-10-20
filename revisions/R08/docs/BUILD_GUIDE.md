# Print and assemble R08

Use R08 chassis **42**, carriage **44**, bridge **55** and one flexure cassette: **57 = 0.8 mm beams**, **58 = 1.0 mm**, or **59 = 1.2 mm**. Adaptor 41, cover 43, magnet retainer 46, Hall mount 47, cartridges 48/49 and inlay 56 retain their R07 geometry. Do not fit the old leaf clamps or metal leaves.

## Print first

The starting assumption is PLA, a 0.4 mm nozzle and 0.20 mm layers at room temperature. The actual printer and filament are still unknown. Files are millimetres at 100% scale. The 3MF plates contain geometry only; no temperature, supports or printer profile is preselected.

Print hardware coupon 52, receiver coupon 53, cartridge 48 and cassette 57 before the large enclosure. Two thicker full cassettes are supplied for comparison. All three have the same mounting holes.

- Check M2/M3 clearance holes and nut pockets with the purchased hardware. Coupon hole diameters are 2.2, 2.4, 3.2 and 3.4 mm; hex pockets are AF4.5 and AF5.8.
- Check the actual 6 × 3 mm magnet in the Ø6.4 mm pocket and the selected TO-92 sensor in its pocket.
- Test the cartridge's 30° locking movement and radial M2 lock in receiver coupon 53.
- Print the cassette **flat as supplied**, with its 43 × 35.4 mm outline on the bed and 2.4 mm height. Use 100% solid fill; keep supports off. Inspect the layer preview: both baseline beams must have continuous bonded extrusion paths, approximately two 0.4 mm roads across their width, with no gaps or deleted thin walls. Adaptive-width paths are acceptable if continuous. Do not assume a two-wall setting guarantees this.
- Avoid a brim that fuses to the beams; if a brim is needed, use it on the thick rails only. Keep the seam away from the flexible spans and root transitions where possible. Do not sand the beam thickness to tune stiffness. Clear strings without nicking the beams.
- Check for cracks, layer separation, uneven beam width or an initially bowed cassette. Reject defective prints and record the filament, printer and settings.

Increasing beam width changes stiffness strongly. The three sizes are **not 1/10/75 gf grades**. Install only one cassette and calibrate that actual assembly. Replacing a cassette invalidates its old calibration.

## Print the housing and remaining parts

The individual STLs are already oriented with their lowest point at Z=0. Suggested starting settings are 4 walls, 5 top/bottom layers and 35–40% infill for the shell/adaptor; solid fill for carriage, cartridges, retainer, knobs and cassette. These settings have not been physically tested.

Chassis 42 prints open upward. Cover 43 prints crown upward and needs accessible underside support. Carriage 44 is supplied nose-down and needs supports under shoulders and mounting features, including support that starts on the model where necessary. Review pocket roofs and support removal access in the slicer. Keep cassette mating faces and cartridge tracks flat and clear. Do not scale the complete assembly to fix a local fit.

The numbered 3MF plates use a 180 × 180 mm layout envelope. Re-arrange for the actual machine. “Print First” contains tolerance parts and flexure alternatives; “Magnetic Head” contains the new head; “Retained Handle” is only needed for a new complete device. The existing handle/vibration geometry and electronics fit limitations are unchanged.

## Assemble

Use small hand tools, tighten gently and evenly, and stop before crushing the plastic. Screw lengths are measured below the head. Brass fasteners near the magnet are preferred; changing magnetic hardware requires recalibration.

1. **Prepare chassis and cover.** Clear support residue. Fit four M3 adaptor nuts, two M3 sensor-mount nuts and two M2 cassette nuts into their underside/rear pockets. The two cassette nuts sit in deep underside pockets; a small adhesive tack can retain them while assembling. Let it cure. Join adaptor 41 with four M3 × 8 button-head screws. Socket-cap heads do not fit those adaptor counterbores.
2. **Prepare the carriage outside the housing.** Insert two M2 nuts into the side slots of the new downward posts. Insert two more M2 nuts for the magnet retainer. Bond the axially magnetized 6 × 3 mm disc into the pocket with a thin compatible adhesive layer and let it cure. Install cap 46 with two M2 × 10 screws. Keep the magnet polarity fixed.
3. **Attach the moving cassette rail.** Put the wide moving rail against the bottoms of the two carriage posts. Its holes are at X188 and X215 in the CAD. Insert **two M2 × 8 screws upward from underneath the cassette** into the post nuts. Their heads remain underneath. The thin beams and opposite fixed rail must remain free of adhesive and damage. The screw heads cannot be reached through the assembled chassis floor, so complete this step outside the housing.
4. **Fit the cartridge lock.** Seat its M2 nut in the receiver's side slot and fit the M2 × 12 screw. Optional knob 51 bonds to its head. Leave the lock loose while inserting the cartridge.
5. **Lower the carriage/cassette assembly into the open chassis.** The narrow fixed rail sits on two pads near the negative-Y wall. Align its holes without bending the cassette into place. The large carriage shoulder must lie between the lower stops.
6. **Use the temporary bridge.** Place three M3 nuts in bridge 55: two mounting nuts and one service-pin nut. Secure it with the two front M3 × 35 cover screws inserted from below. Fit the M3 × 30 service screw into the carriage's shoulder bore. It holds the carriage near neutral, with clearance; do not force the pin. R08 bridge 55 has a notch for access to the front cassette screw.
7. **Attach the fixed cassette rail.** Insert **two M2 × 8 screws downward from above** into the chassis nuts. Tighten evenly while keeping the cassette flat and unstrained. Remove the service pin, check return, and investigate any bowing or rubbing. The screw heads and nut pockets are designed for standard M2 socket caps and AF4 mm nuts, but actual hardware/print fit must be checked.
8. **Install the Hall sensor.** Solder its insulated leads and decoupling capacitor before seating the package. The flat face points toward the magnet. Retain the package with a small adhesive fillet on the back/sides; keep adhesive away from its leads and the moving stage. Mount 47 with two M3 × 6 screws at the middle of the slots. Route and strain-relieve wires along fixed structure, out the side port.
9. **Replace bridge with cover.** Remove the service screw and the two bridge mounting screws. Set the bridge and its three nuts aside. Fit four M3 cover nuts and one M3 service-pin nut into the cover pockets. Secure cover 43 from below with four M3 × 35 screws. The bridge stays outside the device. Bond optional inlay 56 into its shallow recess.
10. **Test and calibrate.** With the entire service screw removed, use rigid bench cartridge 49 against a checked reference balance. Confirm free return before electrical calibration. Follow the wiring/calibration guide. Do not force the mechanism against its stops.

## Replace a cassette

Unload the device and disconnect power. Remove the cover, install the bridge/service pin, remove the two top fixed-rail screws, then remove the bridge and lift the carriage/cassette assembly out. Remove the two underside moving-rail screws and install a new cassette. Reassemble, check return and repeat calibration. Never pull on the beams to remove the cassette.

## Change a filament cartridge

With the tip unloaded, install the service screw. Back out the small cartridge lock at least 3 mm, hold the hub, rotate 30° and withdraw. Insert the replacement, rotate back, seat its flange and tighten the lock gently. Remove the entire service screw before measuring and zero again. The nylon reference in CAD remains unrated; use a separately characterized filament.

## First bench session

Establish print fit, free travel and return-to-zero first. Then measure loading/unloading cycles, dwell drift and sensor response. Stop if a beam cracks, takes a permanent set, rubs the housing or fails to return. Neither a print export nor a clearance check qualifies a plastic spring for accurate force measurement.
