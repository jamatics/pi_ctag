# rangeofMotion

Code developed by CTAG, and optimized for Eurobench by CTAG on Tecnalia
proposal.

## Installation guidelines

Follow the upper [Readme](../README.md) indications.

## Description

### Abstract
This code developed in Octave demonstrate the joint angles are within the 
established joint limits.

The current entry point is [computePI.m](computePI.m).

```octave
computePI("[path_to]/subject_xx_run_xx_jointAngles.csv",
"[path_to]/subject_xx_testbed_lowAssist.yaml", "[path_to]/")
```

The two parameters are:

- `subject_xx_run_xx_jointAngles.csv`: a `csv` file containing the joint angles 
in three dimensions while the first column is the time stamp. 


### Variables

angles: joint angles (degrees)

t:  time at sample rate

joint_limits: minimum and maximum values of the recommend joint angles

## Initial code structure

The current documentation may not be updated.

Octave algorithm to check the investigating joints are within the recommended limits.

The algorithm consists of a function called romCheck that read the joint angles 
and joint limits and return maximum value, minimum value and counter to detect how 
many number of times the joint angles cross the limits.  

## References
1. [Norkin, C.C. and White, D.J., 2016. Measurement of joint motion: a guide to goniometry. FA Davis.](https://books.google.com/books?hl=en&lr=&id=TSluDQAAQBAJ&oi=fnd&pg=PR1&dq=measurement+of+joint+motion&ots=2gaQs8AiB0&sig=5c8ikDlPh13i1wEhxu-FC6P-dRA)
