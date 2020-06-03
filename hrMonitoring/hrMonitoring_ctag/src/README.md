# hrMonitoring

Code developed by CTAG, and optimized for Eurobench by CTAG on Tecnalia
proposal.

## Installation guidelines

Follow the upper [Readme](../README.md) indications.

## Description

### Abstract
This code developed in Octave demonstrates how to measure the Root Mean Square
of Successive Difference (RMSSD),  of the subject performing mobility tasks 

The current entry point is [computePI.m](computePI.m).

```octave
computePI("[path_to]/subject_xx_run_xx_balance.csv", "[path_to]/subject_xx_testbed_lowAssist.yaml")
```

The two parameters are:

- `subject_xx_run_xx_balance.csv`: a `csv` file containing the 3d ground 
reaction forces from left and right hand side force plate , assuming the 
first column is a timestamp in second.

- `subject_xx_testbed_lowAssist.yaml`: yaml file containing testbed 
configuration data related to the industrial use-case.

We are expecting values for left and right hand forces plate in 
the form of the 3d force vector(x, y, z) 

### Variables

Fx (ground medial-lateral forces), 

Fy (ground anterior-posterior forces), 

Fz (ground vertical reaction forces),

Mx,My,Mz(momentums of the forces) (Optional for future use)

BWs1: Body weights of the subject 1.

reactForce_x_l || reactForce_x_r: Fx of both forceplates.

reactForxe_y_r || reactForce_y_r: Fy of both forceplates.

reactForce_z_r || reactForce_z_r: Fz of both forceplates.

DPSI: Dynamic Postural Stability Index.

maxDPSI: maximum value of DPSI matrices.

meanDPSI: mean value of DPSI matrices.

areaDPSI: sum of the values of DPSI matrices.

DPSI_aEnergyVStime: This value is the areaDPSI value divided by the 
time (25 seconds). This value is scaled in the next line: it is divided by 100.
[Maxat, maxTime] [minat, minTime]: Matrices created to find the matching 
time value of the maximum and minimum DPSI and time instance of maximum and
minumum time.

## Initial code structure

The current documentation may not be updated.

Octave algorithm to obtain DPSI (max, min, min time instance, max time instance,
DPSI area vs time) for human mobility in the testbed.

The main simple algorithm uses following functions to obtain the desired:
max function [source octave]

min function [source octave]

mean function [source octave]

sum function [source octave]

store_vector [source EB]

read_simple_yaml [source EB]

## References
1. [Sell, T.C., 2012. An examination, correlation, and comparison of static 
and dynamic measures of postural stability in healthy, physically active 
adults. Physical Therapy in Sport, 13(2), pp.80-86.](https://www.uky.edu/chs/sites/chs.uky.edu/files/SMRI/Publications/Sell_2012_Examination%20correlation%20and%20comparison%20of%20static%20and%20dynamic%20measures%20of%20postural%20stability%20in%20healthy%20physically%20active%20adult_0.pdf)
2. [Wikstrom, E.A., Tillman, M.D., Chmielewski, T.L., Cauraugh, J.H. and Borsa, 
P.A., 2007. Dynamic postural stability deficits in subjects with self-reported 
ankle instability. Medicine & Science in Sports & Exercise, 39(3), pp.397-402.](https://www.academia.edu/download/44341142/Dynamic_postural_stability_deficits_in_s20160402-18805-3xvpcy.pdf)
3. [Schmitz, J., 2017. Comparison and correlation of dynamic postural stability 
indices obtained during different dynamic landing tasks and footwear 
conditions (Doctoral dissertation, University of Pittsburgh).](http://d-scholarship.pitt.edu/32755/1/Schmitzjl_etdPitt2017.pdf)
4. [Wikstrom, E.A., Tillman, M.D., Smith, A.N. and Borsa, P.A., 2005. 
A new force-plate technology measure of dynamic postural stability: 
the dynamic postural stability index. Journal of athletic training, 
40(4), p.305.](https://www.ncbi.nlm.nih.gov/pmc/articles/pmc1323292/)
