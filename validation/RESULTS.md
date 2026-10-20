# R03 verification results

- 31 of 31 CAD parts: valid closed single solids.
- 31 of 31 STL exports: watertight, one connected component, no detected non-manifold edges or self-intersections.
- Maximum STL-versus-STEP volume difference: 0.270%.
- No positive-volume intersections detected between modeled assembled parts or nominal component envelopes in either head configuration.
- Head withdrawal: 12 axial positions per head, no overlaps detected.
- Upper-shell removal: 11 positions, no overlaps detected (display and button cap removed with the lid).
- Carrier: 13 angles including all three straight filament envelopes, no overlaps detected.
- Conservative continuous filament indexing envelope: clear of tested fixed parts.
- Probe: 7 positions across its 6 mm stroke, no rigid overlaps detected.
- Handle wiring: continuous 4.2 mm bundle keepout clear of modeled parts.
- Four 3MF geometry plates: valid archives and XML, mm units, 31 objects inside a 180 × 180 footprint without footprint overlap.
- Bambu Studio 02.08.02.61 CLI import: 31 of 31 objects reported manifold. This is an import check, not a completed slice or physical print.
- Four Blender review images rendered and inspected; native review scene saved.

Limits: sampled rigid checks do not prove every assembly manipulation. The flexible service loop, loaded nylon buckling, real tolerances, fastener torque, contact force, vibration transfer, electrical behaviour and clinical suitability are not established by these checks. Reference components are simplified envelopes. See docs/decisions.md.
