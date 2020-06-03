# hrMonitoring

Code developed by CTAG, and optimized for Eurobench by CTAG on Tecnalia
proposal.

## Installation guidelines

Follow the upper [Readme](../README.md) indications.

## Description

### Abstract
This code developed in Octave demonstrates how to measure the Root Mean Square
of Successive Difference (RMSSD),the standard deviation of the IBI of normal
sinus beats (SDNN), the number of pairs of successive NNs that differ by more 
than 50 ms and  the proportion of NN50 divided by total number of NNs of the 
subject performing mobility tasks 

The current entry point is [computePI.m](computePI.m).

```octave
computePI("[path_to]/subject_xx_run_xx_hrv.csv", "[path_to]/")
```

The two parameters are:

- `subject_xx_run_xx_hrv.csv`: a `csv` file containing the heart rate 
variation  in ms presented in first column. 

We are expecting values for left and right hand forces plate in 
the form of the 3d force vector(x, y, z) 

### Variables

hrv (heart rate variability)

RMSSD: Root Mean Square of Successive Difference

SDNN: The Standard Devaition of the IBI of Normal sinus beats

NN50: The number of pairs of successive NNs that differ by more than 50 ms

pNN50: The proportion of NN50 divided by total number of NNs of the subject
performing mobility tasks

## Initial code structure

The current documentation may not be updated.

Octave algorithm to obtain RMSSD, SDNN, NN50 and pNN50for human mobility 
in the testbed.

## References
1. [Shaffer, F. and Ginsberg, J.P., 2017. An overview of heart rate variability metrics and norms. Frontiers in public health, 5, p.258.](https://www.frontiersin.org/articles/10.3389/fpubh.2017.00258)
