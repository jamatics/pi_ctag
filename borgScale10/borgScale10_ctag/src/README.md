# borgScale10

Code developed by CTAG, and optimized for Eurobench by CTAG on Tecnalia
proposal.

## Installation guidelines

Follow the upper [Readme](../README.md) indications.

## Description

### Abstract
This code developed in Octave demonstrates the borg scale quantitative implementation.

The current entry point is [computePI.m](computePI.m).

```octave
computePI("[path_to]/subject_xx_questionnaire_borgScale10.csv", "[path_to]/")
```

The parameter is:

- `subject_xx_questionnaire_borgScale10.csv`: a `csv` file containing the rquantitative results of subjective borgscale. 

### Variables

sqr: quantitative subject response to Borg Scale 10

## Initial code structure

The current documentation may not be updated.

Octave algorithm to obtain the borg scale total score and score on different body parts. 


## References
1. [Borg, G.A., 1982. Psychophysical bases of perceived exertion. Medicine & Science in Sports & Exercise.](https://psycnet.apa.org/record/2018-29835-001)
2. [Borg, G., 1970. Perceived exertion as an indicator of somatic stress. Scandinavian journal of rehabilitation medicine.](https://psycnet.apa.org/record/2018-29834-001)
