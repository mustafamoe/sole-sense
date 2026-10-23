# SoleSense firmware

Reserved for device firmware. **No firmware is implemented yet.**

Current hardware context: [R08 wiring and calibration](../revisions/R08/docs/WIRING_AND_CALIBRATION.md).

Initial tasks:

- Select the microcontroller board and document the pin map and toolchain.
- Read the Hall sensor through the selected ADC and log raw samples.
- Add tare and calibration storage, with explicit force units.
- Display readings and calibration state on the larger display.
- Implement vibration control and head handling once the electrical interfaces are defined.

Add source code and build instructions here once the board and development framework are selected. Sensor resolution and target-force accuracy must be established by measurements of the complete assembly.
