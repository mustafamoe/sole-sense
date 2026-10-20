# Parts to order — R08 printed-flexure head

This list covers the magnetic head. No purchases have been made. The metal spring stock is removed. Real sensing hardware and fasteners remain. The existing handle/display/vibration parts retain their earlier geometry and unresolved supplier-fit limitations; this is not a reconciliation of every item in the previous buying spreadsheet.

## Sensing parts

| Qty | Part | Exact requirement / sourcing |
|---|---|---|
| 2 recommended; 1 fitted | **Texas Instruments DRV5055A3QLPG** | Through-hole **TO-92 / LPG**, analogue linear Hall sensor. The A3 sensitivity variant is selected. [TI product and datasheet](https://www.ti.com/product/DRV5055) · [Mouser listing](https://www.mouser.com/en/ProductDetail/Texas-Instruments/DRV5055A3QLPG?qs=rrS6PyfT74edxx5gtGLh9w%3D%3D). Do not substitute a digital Hall switch such as A3144. |
| 2 recommended; 1 fitted | **6 mm diameter × 3 mm disc magnet** | Axially magnetized, N35–N42, coated neodymium; no centre hole. [RS UAE Eclipse N807 / 695-0175](https://ae.rsdelivers.com/lt/product/eclipse/n807/eclipse-neodymium-magnet-1kg-length-3mm-width-6mm/6950175) lists the size and N35 grade; confirm axial polarity and availability. RS PRO **219-2237** is another 6 × 3 mm reference; its [manufacturer table](https://docs.rs-online.com/dbe9/A700000007817423.pdf) specifies magnetization through thickness. |
| 1 | **ADS1115 analogue-to-digital breakout** | Use externally for the first bench build. [Adafruit 1085](https://www.adafruit.com/product/1085) is a documented option. A different breakout can work electrically but is not assigned an internal mounting footprint in this release. |
| 1 | **100 nF ceramic capacitor** | Across Hall VCC/GND, close to the package. |
| 1 each, optional filter | **4.7 kΩ resistor + 2.2 µF ceramic capacitor** | Hall output low-pass filter before ADC; roughly 15 Hz. Include the filter during calibration. |
| As needed | 3.3 V controller, regulated supply, insulated leads, heat-shrink | Keep external for first tests. No battery/charger wiring is changed in this revision. |

The Hall device responds to magnetic field; the **calibrated printed flexure assembly** supplies the relationship to force. Its range and the ADC bit count do not establish 1 gf accuracy. TI specifies operation around 3.3 V or 5 V, a half-supply zero-field output and different sensitivity choices; use the A3 variant and the 3.3 V bench wiring described here. [TI datasheet](https://www.ti.com/lit/ds/symlink/drv5055.pdf)

## Fasteners

| Qty fitted | Fastener | Use |
|---|---|---|
| 4 | **M2 × 8 socket-cap screws** | 2 fixed cassette rail screws, 2 moving rail screws |
| 2 | M2 × 10 socket-cap screws | Magnet-retainer screws |
| 1 | M2 × 12 socket-cap screw | Cartridge lock; tip seats in blind pocket, head remains above boss |
| 7 | M2 hex nuts, nominal 4 mm across flats × 1.6 mm thick | Matching locations; printed pockets are AF4.5 |
| 4 | **M3 × 8 button-head** screws, head diameter ≤6.4 mm and height ≤2 mm | Rear adaptor counterbores; taller socket caps will foul the joint |
| 4 | **M3 × 35 socket-cap screws** | Concealed underside cover fasteners; borrow two for the assembly bridge |
| 2 | M3 × 6 socket-cap screws | Adjustable sensor mount |
| 1 | **M3 × 30 socket-cap screw** | Removable service lock; red printed knob fits over the head |
| 14 | M3 hex nuts, nominal 5.5 mm across flats × 2.4 mm thick | 4 adaptor, 4 cover, 2 sensor mount, 1 service lock in cover + 3 in assembly bridge; printed pockets are AF5.8 |

Prefer brass screws/nuts around the magnetic head. Ferromagnetic hardware changes the field and can add attraction forces; if a material is changed, check clearance/signal and recalibrate the final assembly. Fastener envelopes in CAD omit threads and socket recesses. Nut clearances are starting print allowances, checked by coupon 52.

## Consumables and bench tools

- PLA for the first room-temperature bench prints; 0.4 mm nozzle assumed. White for the shell and teal for the separate optional inlay give the pictured finish.
- A small compatible adhesive for magnet retention, Hall-package retention optional knob bonding and decorative inlay bonding. Keep it off flexure beams and mounting faces and cartridge tracks.
- Small M2/M3 hex drivers and calipers; a 3 mm diameter driver-access envelope was checked above the fixed cassette screws.
- Soldering iron, fine solder, insulating heat-shrink and small cable ties.
- A suitable reference balance, preferably with 0.01 g readability or better for early experiments, plus known check weights. Readability alone is not accuracy; verify it before assessing a 1 gf signal.
- Nylon monofilament appropriate to the intended test. The displayed Ø0.9 × 38 mm geometry is **not** an order specification for calibrated force grades. Use the rigid printed bench cartridge for initial calibration.

The links are carried forward as sourcing references; no new stock or delivery check is claimed for R08. Confirm the exact part, package, size and delivery before ordering. Print cassette 57, 58 or 59 instead of buying bronze foil. Only one cassette is installed.
