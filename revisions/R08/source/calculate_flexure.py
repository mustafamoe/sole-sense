"""Ideal-beam sensitivity only. No measured material properties or calibration."""
import json
from pathlib import Path
out=Path(__file__).resolve().parents[1]
rows=[]
for t in [.8,1.,1.2]:
    for E in [1200,2000,2500,3500]:
        k=2*E*2.4*t**3/24**3
        rows.append({'beam_width_mm':t,'assumed_E_MPa':E,'ideal_k_N_per_mm':k,
                     'ideal_force_at_2mm_gf':k*2/.00980665,
                     'ideal_deflection_mm':{str(g):g*.00980665/k for g in [1,10,75]},
                     'ideal_nominal_strain_at_2mm':3*t*2/24**2})
report={'status':'SIZING ONLY; no measured spring or sensor performance',
        'model':'Two ideal fixed-guided beams; ignores fillets, support compliance, rotation, creep and print variation',
        'E_values':'Assumed sensitivity inputs, not a certified PLA property range','rows':rows}
(out/'validation/flexure_sizing.json').write_text(json.dumps(report,indent=2))
print('SIZING_TABLE_WRITTEN',len(rows),'assumed cases')
