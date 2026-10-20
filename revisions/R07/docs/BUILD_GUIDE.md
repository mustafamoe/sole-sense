# Build and print guide

Use the **R07 matched set** for adaptor 41, chassis 42, cover 43 and bridge 55. Inlay 56 is optional. The cover now fastens from below with four **M3 × 35 screws**; the service pin is **M3 × 30**. Order **14 M3 nuts** in total including the bridge. The moving carriage and sensing hardware retain R06 geometry.

## Print this first

Open `print_plates/01_Print_First.3mf` in your slicer. It contains the hardware coupon, exact cartridge receiver and matching cartridge, leaf-length template, and R04 joint coupons. Select your actual printer. The virtual layout fits a 180 × 180 mm bed; re-arrange if your machine is smaller. Keep the geometry at **100% scale / millimetres**.

The working assumption is an FDM printer, 0.4 mm nozzle, 0.20 mm layers and PLA. PLA is a starting material for a room-temperature bench prototype. The springs are metal, not printed plastic. Changing printer/material requires repeating the fit check. No machine-specific G-code is supplied.

1. Check that the selected M2/M3 screws pass freely through the corresponding holes, and their nuts seat without splitting the coupon. Hardware-coupon holes run left to right: 2.2, 2.4, 3.2 and 3.4 mm. Its nut pockets are 4.5 and 5.8 mm across flats.
2. Check the Ø6.4 mm pocket with the actual 6 mm magnet. It should be a clearance fit, not forced into the plastic. The rectangular 4.6 × 3.3 mm pocket checks the Hall package width/depth; the full mount has open-top access.
3. Insert cartridge 48 into receiver coupon 53, rotate through 30° and confirm retention. The M2 lock screw is additional positive retention. Clear stray filament strings; do not file away the bayonet retaining ledge.
4. If the joint coupons are used, also print the retained collar halves from plate 06 and test the R04 joint before printing the complete handle. The collar needs its original M2 assembly bolts.

If a fit is too tight, adjust the relevant clearance in CAD or ream the clearance hole. Do not scale the whole assembly: that changes both spring span and component spacing.

## Main print order

| Plate | Contents | Printing notes |
|---|---|---|
| 01 Print First | Coupons, cartridge 48, leaf template | Coupon blocks flat; inspect receiver bayonet tracks for small supported roofs. |
| 02 Magnetic Head | Adaptor 41, chassis 42, lid 43, carriage 44, Hall mount 47, bench cartridge 49 | Chassis open upward; cover crown upward with its underside on the plate. Inspect the small nut-pocket roofs in layer preview. Carriage is nose-down in the supplied file and needs accessible supports, including supports starting on the model beneath shoulders. Review each object separately. |
| 03 Magnetic Head | Four clamps 45, magnet retainer 46, two knobs 50/51, assembly bridge 55, optional inlay 56 | Flat faces down as supplied; inlay prints separately in teal. Small parts need reliable first-layer adhesion. |
| 04–06 Retained Handle | Existing handle, collar and vibration parts | Only needed if not already built. These retain the R04 geometry and its original assembly requirements. |

Suggested starting settings: 4 walls, 5 top/bottom layers and 35–40% infill for the housing/adaptor; 100% infill for carriage, clamps, retainer, cartridges and knobs. Use a brim on narrow parts if required. These are starting settings, not a tested print profile. Support removal must leave the spring seating faces flat and the cartridge tracks clear. Avoid lubricant around the spring seats, magnet or cartridge.

The parts are individually printable solids. The supplied 3MF plates are neutral geometry, with no printer, material, support or temperature presets. A print service should inspect the layer preview before printing. The two metal leaves are represented only in CAD/reference meshes and must **not** be printed.

## Head assembly

Use the numbered filenames to identify parts. Screws are measured under the head. Prefer brass screws/nuts near the magnet; check purchased hardware dimensions against the coupons. Tighten by feel, evenly, without crushing the plastic. No untested torque value is specified.

1. **Prepare the chassis.** Remove supports and strings. Seat the four M3 adaptor nuts and two underside sensor-mount nuts. The four cover nuts go in the cover itself, not in the chassis posts. The adaptor uses M3 × 8 **button-head** screws; ordinary socket-cap heads are too tall for its counterbores. Fasten adaptor 41 to chassis 42. Keep the cable opening clear.
2. **Prepare the carriage.** Install four M2 nuts behind the moving spring seats. Insert the magnet-retainer nuts through the side openings. Seat the 6 × 3 mm magnet against the pocket floor with a very thin compatible adhesive bond; let it cure. Its flat pole faces point along the device axis. Fit retainer 46 with two M2 × 10 screws. The retainer prevents escape; the bond prevents rattle.
3. **Fit the cartridge lock.** Slide the M2 nut into the side opening in the receiver boss. Fit the M2 × 12 screw. If desired, bond knob 51 to its socket head, keeping adhesive out of the threads. Leave it loose while fitting the cartridge.
4. **Locate the carriage.** Lower it into the open chassis. Its large circular shoulder sits between the lower travel-stop faces. It must not rub the front opening, floor, lid or stops at rest. Fit three M3 nuts into the underside pockets of assembly bridge 55: two mounting nuts and one service-pin nut. Hold the bridge over the front posts and support the loose carriage while securing it with two M3 × 35 cover screws from underneath. Insert the M3 × 30 service screw through its raised boss and into the carriage shoulder. The bridge leaves both spring stations open. Do not force a misaligned pin.
5. **Fit the metal leaves.** Cut two flat C51000 H08 spring-temper strips, each **28 × 12 × 0.10 mm**. Deburr without thinning the working span. Each end has a 5 mm clamp area, leaving **18 mm free**. Install inner clamps 2/4 and outer clamps 1/3 with eight M2 × 10 screws and nuts. The holes are outside the metal: do not drill the strips. Seat both leaves flat without pre-bowing. Tighten the rear leaf first, then the front leaf. Use a 1.5 mm hex key with a short arm no longer than 14 mm so it fits between the stations. Keep the assembly bridge and service pin fitted while tightening.
6. **Install the sensor.** Solder insulated flexible leads and the decoupling capacitor before inserting the Hall package. The flat sensing face points toward the magnet, and the leads point down. A small adhesive fillet on the back/sides retains it; do not cover the sensing face or wick adhesive down the leads. Clamp mount 47 with two M3 × 6 screws, starting at the middle of its slots. Route all wires on fixed structure, through the side cable exit; secure them at the tie holes. No wire should touch or spring-load the moving carriage.
7. **Close and free the mechanism.** Remove the service screw and release the bridge by undoing its two underside screws. Set the bridge and its three nuts aside. Fit four M3 nuts into the underside cover pockets and one into its service-pin pocket; retain them with a tiny adhesive tack if needed and let it cure. Place the cover and secure it with four M3 × 35 screws from underneath. The bridge stays outside the finished head. The service screw must also remain out during measurement. Bond optional teal inlay 56 into the crown recess after checking its fit; keep adhesive out of the service opening. Gently press/release the rigid bench cartridge: it should return freely, with no scrape or sudden step. Do not force the carriage against its stops.
8. **Check electronics and calibrate.** Follow `WIRING_AND_CALIBRATION.md`. Keep external electronics on the bench for the first build. The retained R04 contact placeholders are not a ready-to-wire connector.

The service screw only holds the carriage approximately at neutral; its bore has clearance. Do not use it to force a bowed spring into position. Both spring clamping faces must be aligned before tightening.

## Changing cartridges

With no load applied, install the red service screw to protect the leaves. Back out the small cartridge lock by at least 3 mm. Hold the hub, rotate 30°, then withdraw it. Insert the replacement, rotate back, press the flange against the receiver face, and tighten the small lock gently against the radial pocket floor. The screw head remains above the boss; do not force it flush. Remove the entire service screw before measuring. Zero again after the change. Never use the exposed filament as a handle.

## What can start on 21 October

The coupons and plastic parts can be sent to a printer now. Assembly depends on receiving the sensor, correct spring-temper foil, magnet and fasteners. Delivery dates were not confirmed. The first session should establish fit, free return and a repeatable electrical signal; calibrated clinical measurements are a later validation step.
