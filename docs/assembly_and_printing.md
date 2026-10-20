# PETG printing and assembly

## Print preparation

Use Bambu Studio with the **actual printer and PETG variant** selected. The printer model was not supplied; the 3MF files contain geometry and millimetre units, not machine settings or G-code. Parts are arranged inside a 180 × 180 footprint, with a 10 mm margin. A 0.4 mm nozzle is the chosen starting assumption.

- Dry filament according to its manufacturer. Start from the matching Bambu material preset rather than copying PETG HF temperatures to an unrelated PETG.
- Housing: 0.20 layer, 4 walls, 5 top/bottom layers, 25% gyroid starting settings.
- Carrier, inserts, probe guide and connector panel: 0.12–0.16 layer, 4 walls, 60% infill; use solid small inserts and probe components.
- Apply a 5 mm brim to tall or narrow parts. Inspect the sliced first layer and internal supports before printing.
- The lower handle is oriented **heel-down, 150 mm tall** to keep its internal posts connected to the printed housing. It requires support under board shelves and some horizontal details. The upper handle is seam-down. Hollow heads are nose-down; inspect supports beneath internal anchors and the pilot shoulder.
- Caps, guide, carrier and coupons are individually oriented. Some caps have projecting guide/sensor supports: enable supports where the preview shows islands. Support contact on fitted surfaces must be cleaned without enlarging them arbitrarily.
- Hardware envelopes and assembly-position meshes in `reference/` are **not print files**. Use `stl/` or `print_plates/` only.

## Print these coupons first

`13` checks 3.2 / 3.4 / 3.9 / 4.1 holes, in that order. `15` is the actual head pilot/key; pair it with `16`, `17`, `18` for nominal radial clearances 0.25 / 0.35 / 0.45. `19` is the actual Micro-Fit panel insert.

The full model uses **0.35 radial pilot clearance**, **0.30 shell split gap**, **3.4 M3 clearance holes**, and **4.1 M3 insert bores**. These are nominal CAD values, not printer compensation. Choose the coupon that works with your material, printer and connector. If adjustment is needed, edit `source/interface_config.json` and rebuild. The connector aperture initially follows the manufacturer's nominal panel cutout; do not force an oversized connector into PETG.

## Hardware shopping quantities

Lengths below are starting choices; check protrusion and engagement during assembly. Use pan/socket heads that fit the modeled recesses.

| Hardware | Quantity / use |
|---|---|
| M3 × 16 machine screws | 6, handle closure |
| M3 heat-set inserts, OD suited to tested 4.1 bore, length ≤4 | 6, lower handle |
| M3 × 8 retaining screws | 2 in use, head attachment |
| Short M3 inserts, length ≤3 | 4, two per interchangeable head pilot |
| M2.5 × 8 self-tapping/plastic screws | 6, three per head front cap; 2 more for servo cradle; 2 for optical sensor mount with washers/spacers |
| M2 × 6 screws | Connector insert 2; wire clamp 2; boost shelf 4; carrier retainer 2; guide flange 2; button platform 2 |
| M2 short heat-set inserts | 2, wire clamp, nominal 3.2 OD bore; test actual insert fit |
| Stock SG90 horn center screw | 1, supplied with servo |
| M2 hardware for horn | 2 screws with nuts/washers to clamp stock horn through carrier slots; fit length to actual horn |
| Thin foam tape, insulation, epoxy, 2.5 mm cable ties | PCB retention, nylon potting, wire strain relief and battery isolation |
| 0.5 mm sensor spacers and small washers | 2, under sensor mounting ears |

M2 pilots elsewhere are intended for plastic-thread screws or careful tapping, **not heat-set inserts**. Do not heat-set an insert into the tiny carrier, optical arms or probe guide. Verify screw lengths on the actual print.

## Assembly sequence

1. Inspect and deburr coupons. Confirm the selected connector snaps into the 2 mm panel and can be released. Set the joint clearance before committing to both head prints.
2. Fit the six lower-handle inserts and four short head inserts. Let them cool fully. Fit shell alignment pins without forcing them.
3. Install the protected, insulated battery into the lower saddles with thin removable foam restraint. Install the controller tray and low-profile controller wiring. Use insulating pads beneath exposed solder joints. Battery and board terminals must not touch.
4. Secure the USB-C charger on its side tray. Check socket alignment with the side opening using an actual cable plug. Install the separate protection board on tray `31`. Mount SD on `05`, then the boost converter on `20`; the boost shelf screws into the four SD-tray columns.
5. Install button platform `29`, switch and cap. Shim for a small unloaded gap. Retain the OLED in the upper pod with the rear frame and thin foam/adhesive. Retain the heel slide switch. Leave service slack to lift the upper housing; unplug its leads before complete removal.
6. Crimp the handle harness and check cavity numbering. Snap the panel plug into insert `06`; screw the insert to its lower-shell ribs. Route through clamp `14`, using a soft liner if necessary. Tighten only enough to restrain the bundle.
7. Fit the SG90 into cradle `09`, aligning its shaft with the carrier centre. Fasten the cradle to the head bosses, strap the servo, and shim as needed. Install the stock horn in `21`, clamp it through the two slots, and retain it with the stock centre screw. Do not substitute a printed servo spline.
8. Pot one nylon in each of `22–24`. Maintain straight alignment and a 38 mm free length for the initial build. Label the inserts by their **measured complete-system output**, not the rendered diameter. Fit retainer `25` with its two screws.
9. Press the PTFE tube into guide `27`, then fit the guide to cap `08`. Slide in the smooth shaft and bond the rear pad/flag and front tip with their axes aligned. Verify the full 6 mm stroke and free sliding. Pull the tip forward manually to reset; there is no return spring.
10. Fit the TCST2103 on its slotted arms with 0.5 mm spacers. Adjust so the opaque flag switches at approximately 5 mm inward travel, before the 6 mm stop. Check the flag clears the fork throughout movement. Trim or bend the sensor leads along the head axis before insulating; full straight leads are not accommodated radially. Insulate and restrain sensor leads outside the nylon bending space.
11. Mount the vibration motor in cap `11`, mount its driver in the reserved upper cavity, and route its harness through the tie points. Assemble each cap with three screws.
12. Test both heads with the handle open, initially on a current-limited bench supply. Confirm the harness never enters the carrier or probe path. Close the handle after checking board retention, button action, charging access and wire clearance.

## Physical acceptance checks still required

- Dry fit actual modules, all screws, connector latch, handle lid and both head pilots. Check that head removal exposes the latch without loading conductors.
- Hand-cycle the carrier unloaded through all three positions; establish actual servo endpoints without hitting a stop. Confirm the selected nylon lines up with the probe pad in every position.
- Measure probe breakaway force, return/reset behaviour and gravity sensitivity. No rubbing flag, shaft or guide is acceptable for the low-force test.
- Calibrate the **complete assembled probe** against the requested 1 / 10 / 75 gf targets in its use orientation, over repeated applications. A CAD clearance check does not prove these forces. Nylon selection and possibly moving-mass/guide revision are bench outcomes.
- Verify optical switching, head ID, supply sag, charger operation and motor-drive behaviour. Validate vibration at the contact surface; a coin motor's speed rating alone is not a calibrated vibration stimulus.

This package is complete as a reviewable geometric prototype. It remains a bench build until those physical checks pass; no clinical performance or skin-contact material validation is claimed.
