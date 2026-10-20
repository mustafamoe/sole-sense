# Wiring and head exchange

This is a wiring allocation for the mechanical prototype, not a tested PCB schematic. Select wire, protection and crimp tooling against actual load measurements.

The connector is mechanically keyed. Follow the **moulded cavity numbers / manufacturer drawing**; the front and wire-entry views are mirrored. The following allocation is a design choice, not a Molex standard pinout.

| Cavity | Signal | Filament head | Vibration head |
|---|---|---|---|
| 1 | Ground | Servo and sensor ground | Driver and motor return |
| 2 | Regulated 5 V | Servo supply | Motor supply through driver |
| 3 | 3.3 V | Optical LED resistor supply and sensor circuit | Optional ID network only |
| 4 | Actuator control | Servo PWM, ESP32 GPIO25 | Motor-driver PWM |
| 5 | Travel input | TCST2103 phototransistor collector, pull-up to 3.3 V | Unconnected |
| 6 | Head ID | 10 kΩ to ground | 22 kΩ to ground |

Use **GPIO25 for cavity 4**, **GPIO32 for cavity 5**, and ADC-capable **GPIO34 for cavity 6**. On the handle, pull head ID up to 3.3 V through 10 kΩ and classify the measured divider voltage with tolerances. Leave power and PWM disabled for an unknown ID. Firmware is not included.

OLED: SDA21 / SCL22 at 3.3 V. SD: MOSI23 / MISO19 / SCK18 / CS5. Response button GPIO4 with external 10 kΩ pull-down, as specified in the source PDF. Check boot-strapping behaviour of the assembled board and SD interface before adopting this mapping in firmware.

For TCST2103, use its datasheet E/D polarity marks. Provide the LED with a current-limiting resistor (220 Ω from 3.3 V is a starting bench value), phototransistor emitter to ground, collector with 10 kΩ pull-up to 3.3 V. The optical sensor is a travel gate, not a force sensor. Adjust its mounting position and test actual switching under ambient light.

For the vibration head, use a 3.3 V logic-compatible low-side MOSFET driver, a gate pull-down, a gate resistor and a flyback diode. Do not drive the motor from an ESP32 GPIO. Route motor current back to connector ground, not through the sensor input.

## Harness geometry

Six 24 AWG flexible conductors, each ≤1.3 mm outside diameter, fit inside the **4.2 mm bundle reserve**. The clamp has a 4.8 mm bore; add a soft liner only after checking grip on the real insulation. Do not crush conductors. Twist/bundle loosely, and keep the larger service loop separate from the rigid handle route.

The CAD includes a continuous handle route (`reference/Handle_Harness_Keepout.step`) and tie slots in both heads. Leave approximately **60–80 mm of free service lead** between each head's tie point and its receptacle, adjusting after a physical mock-up. Fold it into the cavity ahead of the pilot and along the head's side. Keep it outside the rotating carrier and probe path. The flexible loop itself is not collision- or bend-radius-simulated.

## Swapping heads

1. Turn off boost power and wait for the rail to discharge.
2. Undo the two M3 side retaining screws. Pull the head straight forward by its keyed pilot, supporting the head so the lead is not loaded.
3. Expose and press the connector latch, then separate the connector housings. Do not pull on wires.
4. Plug in the other head, fold the slack into the cable space, align the top key and seat the head. Tighten retaining screws lightly.
5. Enable power; verify the detected head type. With the filament head, pull the probe fully forward before servo indexing.

## Power arrangement

Use a protected single-cell battery path with a separately rated ≥5 A 1S protection board, then the U3V40F5 boost supply. Feed the ESP32 DevKit's 5 V input and servo from the regulated 5 V rail; use the DevKit's 3.3 V regulator only for appropriate logic loads. Add local servo decoupling and measure rail sag at startup/stall. The converter's input-current rating is not a promised output current.

TP4056 is a charger, not a complete load-sharing power system. This revision is **powered off while charging**. The heel switch pulls the boost EN line low for OFF; verify the enable wiring against the chosen converter revision. Charging remains available. Do not connect two unreviewed protection paths or allow simultaneous USB programming and battery-supply backfeed. This electrical implementation needs a bench check before battery operation.
