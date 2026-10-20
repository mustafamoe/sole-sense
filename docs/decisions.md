# R03 — decisions made to complete the model

This is an assembled bench prototype, designed from the supplied hardware PDF and the swappable-head requirement. The original models are preserved. Dimensions below are in millimetres. Manufacturer dimensions and deliberately selected purchasing limits are distinguished below; reference blocks are not detailed supplier CAD.

## Selected hardware and dimensions

| Item | Decision / model allowance | Mount and access |
|---|---|---|
| Controller | Espressif ESP32-DevKitC V4, ESP32-WROOM-32 variant, 38 pins. Manufacturer PCB 48.26 × 27.94; reserved 52 × 28 × 12 including low-profile wiring | Removable strap tray; solder wires or use low-profile connections, not tall Dupont plugs. Open handle for programming |
| Display | SSD1306 0.96-inch I²C 128×64 **generic module, maximum 27 × 27 × 5** | Recess, rear retainer and foam pads; 23 × 12.5 viewing opening. This is a procurement dimensional specification, not an identified vendor SKU |
| Battery | One pre-tabbed 18650, 2200–3000 mAh, discharge capability ≥5 A; **cell assembly maximum Ø18.6 × 67** | Integral saddles, thin insulating foam retention. No oversized commercial battery holder; no soldering directly to a bare cell |
| Charger | TP4056 USB-C, **maximum 28 × 17 × 5**, with socket on the short end | Side charging pod and replaceable tray. Port alignment assumes a centered USB-C socket; verify sample before final print |
| Battery protection | Separate 1S protection board rated ≥5 A discharge, **maximum 16 × 12 × 5** | Dedicated removable tray. Do not rely on an unspecified TP4056 module's protection MOSFETs for servo peak current |
| Boost converter | Pololu **4012 / U3V40F5**, 5 V; nominal 15.24 × 15.24 × 5.6 without headers | Shelf above microSD; 4 A is a typical input-current capability, not a guaranteed 5 V output rating |
| Storage | 3.3 V-compatible microSD SPI breakout, **maximum 24 × 25 × 5** | Removable shelf; open housing and remove boost shelf for card access. Large 5 V level-shifter modules are excluded |
| Response button | 6 × 6 tactile switch, **5 mm overall height** | Screw-mounted platform; shim to approximately 0.15 mm unloaded gap below cap |
| Power control | SS12D00G3-style miniature slide switch; body allowance **8.6 × 4.2 × 4.2**, knob envelope shown | Adhesive-retained heel pocket. Switch controls boost enable, not the servo power current |
| Servo | Genuine TowerPro **SG90**, body specification 23 × 12.2 × 29; 30.3 overall axial reserve including shaft, 32.3 flange width and flange underside 17 from base (3 mm flange thickness allowance) | Adjustable strap cradle. Use the supplied horn and screw. Trim a two-arm horn to ≤27 × 5.6 × 2.5 where necessary, preserving its spline and screw holes |
| Travel sensor | Vishay **TCST2103** optical interrupter; 24.5 × 6.3 × 10.8 body, 3.1 slot, 19 mounting pitch | Adjustable slotted mount on front cap; 0.5 mm spacers under mounting ears. Flag reaches optical axis at about 5 mm travel |
| Vibration motor | Adafruit **1201**, Ø10 × 2.7 coin motor | Adhesive retained in rear-opening pocket behind dome |
| Vibration driver | Custom 20 × 10 × 6 maximum insulated perfboard with AO3400A MOSFET, flyback diode, gate resistor and pull-down | Adhesive mount in the upper side of vibration head. Electrical layout is not included in this CAD package |
| Head connector | Molex **43020-0600** panel plug and **43025-0600** receptacle | Replaceable 2 mm panel insert, manual latch access after withdrawing head, separate mechanical retention |
| Connector terminals | Select gold **43031-0002** male with pre-lubricated RMF **46235-5001** female; 24 AWG conductors, insulation OD ≤1.3 | RMF female selection improves repeated mating versus standard tin terminals. Confirm the complete mating pair and crimp tooling with supplier; do not infer unlimited cycle life |
| Force inserts | Three loose nylon monofilaments, individually potted into removable printed cartridges | Ø1.3 potting bore, 38 free length measured from insert face. The Ø0.9 cylinders in the model are **clearance references, not selected/calibrated filament gauges** |
| Probe | Polished Ø3 × 20 shaft, PTFE sleeve OD4 / ID3.2 × 7.5, printed pad and rounded tip | 6 mm mechanical travel; 1 mm unloaded gap before nylon contact. Manual reset by pulling the tip collar fully forward; no return spring |

## Changes from the concept PDF

- Carrier pockets are spaced **60°**; the servo traverses **120° total**. The PDF's three 120° indexing steps do not suit an ordinary limited-travel SG90. Start near 15° / 75° / 135°, then calibrate each position on the actual servo. Never rotate while the probe is depressed.
- The lever microswitch is replaced with a **non-contact optical gate**. A conventional switch can add a force larger than the 1 gf target. This removes switch actuation load; guide friction and probe weight still require measurement.
- A separate **5 V boost supply** is included. An AMS1117 linear regulator cannot produce a stable 5 V servo rail from one 18650 cell.
- The housing uses **screws and inserts**, with alignment pins and fit coupons, for repeated opening in PETG. It does not rely on the PDF's untested 0.15 mm snap fit.
- The electrical head joint is a **manual locking plug**, with a service loop. It is not a blind-mating pogo connector, magnetic joint or hot-swap power interface.
- The head is longer to accommodate the actual mechanism: approximately **270.3 mm overall** with the filament probe extended; **185.3 mm** with the vibration head. Handle length is 150, grip diameter 46, and head diameter 54. These are deliberate packaging changes.

## What is and is not established

The CAD establishes nominal packaging, part clearances and sampled rigid movement. It does not establish print accuracy, purchased-module fit, electrical performance, medical suitability or calibrated force. Generic modules must meet the specified dimensions; a shared chip name does not guarantee a PCB footprint.

The requested **1 / 10 / 75 gf** values are calibration targets only. Do not substitute the PDF's monofilament gauge labels for measurement. Measure the complete probe assembly in its intended orientation: shaft/tip weight, stiction, nylon length, potting, humidity and bending geometry all affect output. A 1 gf result may require reducing moving mass or changing the guide architecture after physical testing. The rounded Ø7 mm contact tip also has a different contact area from a nylon filament directly touching the test surface: matching force alone does not establish equivalence to a monofilament test. Do not mark this revision as a clinical instrument.

## Sources used

- User-supplied *SoleSense Hardware Materials & How They're Used*, four-page PDF.
- [Espressif DevKitC V4 dimensional drawing](https://dl.espressif.com/dl/schematics/esp32_devkitc_v4_dimensions.pdf)
- [Espressif DevKitC V4 guide](https://documentation.espressif.com/esp-dev-kits/en/latest/esp32/esp32-devkitc/user_guide.html)
- [TowerPro SG90 specifications and travel information](https://towerpro.com.tw/product/sg90-7/)
- [Vishay TCST2103 drawing](https://www.vishay.com/docs/81147/tcst2103.pdf)
- [Omron D2F switch operating-force specifications](https://components.omron.com/sites/default/files/datasheet_pdf/B036-E1.pdf)
- [Pololu U3V40F5 specifications](https://www.pololu.com/product/4012)
- [Adafruit 1201 motor dimensions](https://www.adafruit.com/product/1201)
- [Molex 43020-0600](https://www.molex.com/en-us/products/part-detail/430200600), [43025-0600](https://www.molex.com/en-us/products/part-detail/430250600), [RMF terminal range](https://www.molex.com/en-us/products/series-chart/46235)
- [Bambu PETG HF guidance](https://bambulab.com/es-mx/filament/petg-hf); use the profile for the actual PETG variant purchased.
