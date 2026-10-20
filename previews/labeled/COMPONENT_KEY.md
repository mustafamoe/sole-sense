# SoleSense R03 — component key

P numbers match the existing STL filename prefixes. H numbers identify hardware references in the review scenes. F labels identify integral features, not separate parts.

The hardware is shown as simplified packaging envelopes, not detailed vendor CAD. Exploded offsets are illustrative. Nylon reference diameters do not specify calibrated forces.

## Printed device components

| Label | Component | STL |
|---|---|---|
| P01 | Lower handle shell | `01_Handle_Lower.stl` |
| P02 | Upper handle shell | `02_Handle_Upper.stl` |
| P03 | ESP32 controller tray | `03_Controller_Tray.stl` |
| P04 | USB-C charger tray | `04_Charger_Tray.stl` |
| P05 | microSD tray | `05_SD_Tray.stl` |
| P06 | Connector panel insert | `06_MicroFit_Panel_Insert.stl` |
| P07 | Filament head body | `07_Filament_Head_Body.stl` |
| P08 | Filament front cap | `08_Filament_Front_Cap.stl` |
| P09 | SG90 strap cradle | `09_SG90_Strap_Cradle.stl` |
| P10 | Vibration head body | `10_Vibration_Head_Body.stl` |
| P11 | Vibration dome cap | `11_Vibration_Dome_Cap.stl` |
| P12 | Response button cap | `12_Button_Cap.stl` |
| P14 | Handle wire clamp | `14_Handle_Wire_Clamp.stl` |
| P20 | Boost converter shelf | `20_Boost_Shelf.stl` |
| P21 | Three-position carrier | `21_Three_Position_Carrier.stl` |
| P22 | Nylon cartridge 1 | `22_Nylon_Insert_1.stl` |
| P23 | Nylon cartridge 2 | `23_Nylon_Insert_2.stl` |
| P24 | Nylon cartridge 3 | `24_Nylon_Insert_3.stl` |
| P25 | Cartridge retainer | `25_Insert_Retainer.stl` |
| P26 | Probe rear pad + optical flag | `26_Probe_Rear_Pad_and_Flag.stl` |
| P27 | Probe guide flange | `27_Probe_Guide.stl` |
| P28 | Rounded probe contact tip | `28_Probe_Tip.stl` |
| P29 | Tactile switch platform | `29_Button_Platform.stl` |
| P30 | OLED retaining frame | `30_OLED_Retainer.stl` |
| P31 | Battery protection tray | `31_Battery_Protection_Tray.stl` |

## Hardware references

| Label | Component | Description |
|---|---|---|
| H01 | ESP32-DevKitC V4 | 52 x 28 x 12 mm board allowance |
| H02 | SSD1306 OLED module | 0.96 in; max. 27 x 27 x 5 mm |
| H03 | 18650 battery | Pre-tabbed; max. diameter 18.6 x 67 mm |
| H04 | TP4056 USB-C charger | Module max. 28 x 17 x 5 mm |
| H05 | 1S battery protection board | Max. 16 x 12 x 5 mm; specify >=5 A |
| H06 | Pololu U3V40F5 boost board | 5 V supply; Pololu part 4012 |
| H07 | microSD SPI breakout | 3.3 V module; max. 24 x 25 x 5 mm |
| H08 | Response tactile switch | 6 x 6 x 5 mm |
| H09 | Power slide switch | SS12D00G3-style; boost enable |
| H10 | Mated 6-way connector | Molex 43020-0600 + 43025-0600 |
| H11 | SG90 micro servo | TowerPro; nominal package shown |
| H12 | Supplied SG90 servo horn | Retain original spline and centre screw |
| H13 | Nylon monofilament 1 | 38 mm free length; calibrate force |
| H14 | Nylon monofilament 2 | 38 mm free length; calibrate force |
| H15 | Nylon monofilament 3 | 38 mm free length; calibrate force |
| H16 | Polished probe shaft | Diameter 3 x 20 mm |
| H17 | PTFE guide bushing | OD 4 / ID 3.2 x 7.5 mm |
| H18 | TCST2103 optical interrupter | Probe travel gate; Vishay |
| H19 | Coin vibration motor | Adafruit 1201; diameter 10 x 2.7 mm |
| H20 | Motor driver board | Custom MOSFET board; 20 x 10 x 6 mm |
| H21 | Head retaining screws | Two M3 x 8; one may be hidden |
| H22 | Handle-side panel plug | Molex 43020-0600; envelope only |
| H23 | Head-side receptacle | Molex 43025-0600; envelope only |
| H24 | Head service harness | Six flexible conductors; loop illustrative |
| H25 | Handle wire bundle | Six conductors through strain relief |

Display glass is a visual face of H02, not an additional supplied part. H10 is the mated packaging reference; H22 and H23 show its two halves separated. H21 represents two head retaining screws. H24/H25 are illustrative wire routes, not separate PCB components.

## Integral features

| Label | Feature | Description |
|---|---|---|
| F01 | USB-C charging opening | Opening in the lower handle shell |
| F02 | Head alignment key | Integral printed feature of each head |
| F03 | Handle pilot receiver rim | Integral part of the lower handle shell |

## Fit coupons — print aids, not installed components

| Label | Coupon | STL |
|---|---|---|
| P13 | Fastener fit coupon | `13_Fastener_Fit_Coupon.stl` |
| P15 | Male joint fit coupon | `15_Head_Joint_Test_Male.stl` |
| P16 | Female fit coupon / 0.25 mm | `16_Head_Joint_Test_Female_24.stl` |
| P17 | Female fit coupon / 0.35 mm | `17_Head_Joint_Test_Female_35.stl` |
| P18 | Female fit coupon / 0.45 mm | `18_Head_Joint_Test_Female_44.stl` |
| P19 | Connector panel fit coupon | `19_MicroFit_Panel_Test.stl` |

## Other assembly hardware

Most small screws, inserts, cable ties, foam and adhesive are not modeled separately. Their quantities and installation locations are in the included `assembly_and_printing.md`. Labels identify modeled components; a numbered illustration is not a complete purchasing list.

## Image files

- 05_Opposite_side_Labeled.png
- 06_Top_view_Labeled.png
- 07_Underside_Labeled.png
- 08_Exploded_handle_Labeled.png
- 09_Exploded_filament_head_Labeled.png
- 10_Exploded_vibration_head_Labeled.png
- 11_Swappable_head_connection_Labeled.png
- 12_Vibration_configuration_Labeled.png
