# First bench wiring and calibration

## Electrical connection

Use an external regulated **3.3 V** supply/controller and ADS1115 breakout for the first build. The Hall sensor mount is for **DRV5055A3QLPG**, the through-hole TI LPG/TO-92 package. Check the package orientation against the [TI pin drawing](https://www.ti.com/lit/ds/symlink/drv5055.pdf); do not infer pin order from an unrelated Hall sensor.

| Connection | Destination |
|---|---|
| Hall pin 1, VCC | Regulated 3.3 V |
| Hall pin 2, GND | Common ground |
| Hall pin 3, OUT | ADS1115 A0, directly or through the filter below |
| 100 nF capacitor | Hall VCC to GND, close to the sensor |
| ADS1115 supply | Same 3.3 V rail; follow the breakout's marked supply pins |
| ADS1115 ground | Common ground |
| ADS1115 SDA/SCL | Controller I²C pins, with pull-ups to 3.3 V |
| ADS1115 A1, optional supply monitor | Hall's 3.3 V rail |

Optional low-pass: Hall OUT → 4.7 kΩ → A0; 2.2 µF ceramic from A0 to ground. This is approximately a 15 Hz filter. Calibrate with the final filter installed. Start with ADS1115 ±4.096 V input range and a moderate data rate such as 64 samples/second; slower averaging improves steadiness but adds delay. Inputs must remain within the ADC supply rails even when a wider full-scale range is selected. [TI ADS1115 documentation](https://www.ti.com/product/ADS1115) · [Adafruit breakout](https://www.adafruit.com/product/1085).

The ADS1115 uses an internal reference. Sharing its supply with the Hall sensor does **not** itself make the measurement ratiometric. If you record both A0 and the sensor supply on A1, a starting calibration input is `A0_voltage / supply_voltage`; this helps track slow supply changes. Record temperature and do not treat supply normalization as compensation for all drift.

The Hall package's flat sensing face points toward a flat pole face of the magnet. At neutral, the CAD places the package face about **8.2 mm** from the magnet face, adjustable between approximately **7.2 and 9.2 mm**. The sensing element is inside the package, so this is not the distance to the active die. Choose either magnetic pole, keep it fixed, and determine the output direction during calibration.

Route wires along stationary structure and out through the 8 × 5 mm side opening. Use the tie holes for strain relief. No wires or adhesive should touch the moving carriage or the free flexure spans. Keep the vibration motor off while evaluating the pressure signal.

The R04 spring-contact/pad models remain hidden references in the native CAD. They are not selected connectors or a tested pinout. This revision provides a bench cable route; it does not validate hot swapping, implement head identification or connect the sensor to existing firmware. Do not connect a 5 V motor supply directly to a 3.3 V ADC input.

## Calibration sequence

1. Fit rigid **bench cartridge 49**, remove the entire service screw, and leave the small cartridge lock tightened. Hold the device in the orientation in which it will be calibrated. Confirm the carriage returns freely and rests away from both stops.
2. Power the circuit and let the baseline settle. Confirm the output is within the ADC/sensor rails and changes smoothly with gentle load. A saturated or flat signal is not a valid measurement. Adjust the sensor gap only while unloaded, then tighten the mount and repeat the baseline check.
3. Use a suitable checked balance and a steady fixture. Press the broad calibration pad axially on the balance. Increase load gradually while watching travel. Log the actual balance reading and raw Hall signal together at **0, 1, 2, 5, 10, 20, 50 and 75 gf**, first loading and then unloading, but only while clearly below the stop and within the sensor range. If a target reaches the stop, record it as unavailable; do not force it. Try a stiffer cassette and recalibrate if needed. Repeat at least five cycles. These are test points, not a safety limit for a person.
4. Fit a monotonic lookup table or interpolation from the measured sensor signal to force. Magnetic field varies nonlinearly with distance, and the printed cassette and mounts will differ from the simple beam estimate. A single voltage-per-gram multiplier is not assumed.
5. At a load comfortably below the stop, record a 30-second hold and at least 60 seconds of unloaded recovery. Repeat at a second load. Log continuing drift and return-to-zero; these intervals are exploratory tests, not a qualified duty cycle. Repeat a set of at least 20 gentle loading cycles and inspect the beams for cracks or permanent set. Longer-term fatigue and aging remain untested.
6. Check intermediate loads that were not used to fit the table. Record error, repeatability, loading/unloading difference, return-to-zero, drift and settling time. Assess the 1 gf signal against the measured noise and zero drift; do not round a noisy output to imply accuracy.
7. Recheck after rotating the device, replacing the cartridge, changing temperature, or retightening or replacing a cassette. Moving-part weight changes the baseline with orientation. Zero in the measurement orientation; reorienting while in contact can invalidate that zero.
8. Repeat the force checks with the actual filament cartridge and intended contact geometry. A filament that buckles at a low force cannot automatically deliver 75 gf. Its diameter, free length, material, end condition and conditioning require separate characterization.

The mechanical stops divert further load into the housing after contact. Beyond a stop, the Hall signal no longer represents the total applied tip force. The application must reject readings near/at the stop or when the signal saturates. A stop protects travel; it is not a calibrated force limiter.

`calibration_log_template.csv` is provided for bench notes. No coefficients, accuracy specification or clinical thresholds are preloaded. The first build is for inanimate test fixtures and reference loads; patient-contact suitability and hygiene have not been established.

## Printed-cassette records

Record cassette number/beam width, print date, filament brand/lot, printer, nozzle, layer height, measured beam width, temperature, orientation, loading rate and dwell time. Repeat zero and reference-load checks after rest and on later days. Store the mechanism unloaded with the service screw removed. Replacing or retightening the cassette requires calibration again. A display that resolves 1 gf is not evidence that the mechanism measures it accurately.
