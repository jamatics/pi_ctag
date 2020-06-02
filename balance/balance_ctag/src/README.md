# balance

Code developed by CTAG, and optimized for Eurobench by CTAG on Tecnalia
proposal.

## Installation guidelines

Follow the upper [Readme](../README.md) indications.

## Description

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
