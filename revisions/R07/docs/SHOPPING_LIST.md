# Parts to order — R07 magnetic head

Quantities below are for the new head only. Buy a few spare small fasteners. The retained handle, battery, display, vibration motor and collar hardware are listed in the earlier R04/R03 documentation. No purchases have been made. R07 changes the four cover screws to M3 × 35, the service screw to M3 × 30 and adds two M3 nuts for the bridge. All sensing parts remain the same.

## Sensing parts

| Qty | Part | Exact requirement / sourcing |
|---|---|---|
| 2 recommended; 1 fitted | **Texas Instruments DRV5055A3QLPG** | Through-hole **TO-92 / LPG**, analogue linear Hall sensor. The A3 sensitivity variant is selected. [TI product and datasheet](https://www.ti.com/product/DRV5055) · [Mouser listing](https://www.mouser.com/en/ProductDetail/Texas-Instruments/DRV5055A3QLPG?qs=rrS6PyfT74edxx5gtGLh9w%3D%3D). Do not substitute a digital Hall switch such as A3144. |
| 2 recommended; 1 fitted | **6 mm diameter × 3 mm disc magnet** | Axially magnetized, N35–N42, coated neodymium; no centre hole. [RS UAE Eclipse N807 / 695-0175](https://ae.rsdelivers.com/lt/product/eclipse/n807/eclipse-neodymium-magnet-1kg-length-3mm-width-6mm/6950175) lists the size and N35 grade; confirm axial polarity and availability. RS PRO **219-2237** is another 6 × 3 mm reference; its [manufacturer table](https://docs.rs-online.com/dbe9/A700000007817423.pdf) specifies magnetization through thickness. |
| 1 sheet; 2 strips fitted | **C51000 H08 phosphor-bronze spring stock, 0.10 mm thick** | Cut two **28 × 12 mm** strips. Specify spring temper explicitly. A 100 × 100 mm sheet leaves ample spares. [Retail foil lead](https://homediyer.com/products/phosphor-bronze-sheet-plate-flat-panel-foil) advertises 0.1 mm foil but exact alloy/temper must be confirmed; do not order unverified soft copper as an equivalent. [C51000 material reference](https://alloys.copper.org/alloy/C51000). |
| 1 | **ADS1115 analogue-to-digital breakout** | Use externally for the first bench build. [Adafruit 1085](https://www.adafruit.com/product/1085) is a documented option. A different breakout can work electrically but is not assigned an internal mounting footprint in this release. |
| 1 | **100 nF ceramic capacitor** | Across Hall VCC/GND, close to the package. |
| 1 each, optional filter | **4.7 kΩ resistor + 2.2 µF ceramic capacitor** | Hall output low-pass filter before ADC; roughly 15 Hz. Include the filter during calibration. |
| As needed | 3.3 V controller, regulated supply, insulated leads, heat-shrink | Keep external for first tests. No battery/charger wiring is changed in this revision. |

The Hall device responds to magnetic field; the **calibrated spring assembly** supplies the relationship to force. Its range and the ADC bit count do not establish 1 gf accuracy. TI specifies operation around 3.3 V or 5 V, a half-supply zero-field output and different sensitivity choices; use the A3 variant and the 3.3 V bench wiring described here. [TI datasheet](https://www.ti.com/lit/ds/symlink/drv5055.pdf)

## Fasteners

| Qty fitted | Fastener | Use |
|---|---|---|
| 10 | M2 × 10 socket-cap screws | 8 leaf-clamp screws, 2 magnet-retainer screws |
| 1 | M2 × 12 socket-cap screw | Cartridge lock; tip seats in blind pocket, head remains above boss |
| 11 | M2 hex nuts, nominal 4 mm across flats × 1.6 mm thick | Matching locations; printed pockets are AF4.5 |
| 4 | **M3 × 8 button-head** screws, head diameter ≤6.4 mm and height ≤2 mm | Rear adaptor counterbores; taller socket caps will foul the joint |
| 4 | **M3 × 35 socket-cap screws** | Concealed underside cover fasteners; borrow two for the assembly bridge |
| 2 | M3 × 6 socket-cap screws | Adjustable sensor mount |
| 1 | **M3 × 30 socket-cap screw** | Removable service lock; red printed knob fits over the head |
| 14 | M3 hex nuts, nominal 5.5 mm across flats × 2.4 mm thick | 4 adaptor, 4 cover, 2 sensor mount, 1 service lock in cover + 3 in assembly bridge; printed pockets are AF5.8 |

Prefer brass screws/nuts around the magnetic head. Ferromagnetic hardware changes the field and can add attraction forces; if a material is changed, check clearance/signal and recalibrate the final assembly. Fastener envelopes in CAD omit threads and socket recesses. Nut clearances are starting print allowances, checked by coupon 52.

## Consumables and bench tools

- PLA for the first room-temperature bench prints; 0.4 mm nozzle assumed. White for the shell and teal for the separate optional inlay give the pictured finish.
- A small compatible adhesive for magnet retention, Hall-package retention optional knob bonding and decorative inlay bonding. Keep it off spring working spans and cartridge tracks.
- Fine shears, a deburring stone, calipers and a micrometer suitable for 0.10 mm foil. The template checks length/width, not thickness.
- 1.5 mm hex key with a short arm no longer than 14 mm for internal M2 clamps; suitable M3 hex keys.
- Soldering iron, fine solder, insulating heat-shrink and small cable ties.
- A suitable reference balance, preferably with 0.01 g readability or better for early experiments, plus known check weights. Readability alone is not accuracy; verify it before assessing a 1 gf signal.
- Nylon monofilament appropriate to the intended test. The displayed Ø0.9 × 38 mm geometry is **not** an order specification for calibrated force grades. Use the rigid printed bench cartridge for initial calibration.

Listings were checked on 20 October 2026. UAE storefronts and international stock are not promises of delivery by 21 October. Confirm stock, shipping and the spring material specification before checkout. The metal springs are the most important sourcing item to resolve.
