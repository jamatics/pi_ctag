# questionnaire

Code developed by CTAG, and optimised for Eurobench by CTAG on Tecnalia
proposal.

## Installation guidelines

Follow the upper [Readme](../README.md) indications.

## Description

### Abstract
This code developed in Octave demonstrates how to predict the metabolic rate 
in kilocalories (kcal) of a human being performing different tasks.

The current entry point is [computePI.m](computePI.m).

```octave
computePI("[path_to]/subject_xx_questionnaire_ID.csv", "[path_to]/")
```

The parameter is:

- `subject_xx_questionnaire_ID.csv`: a `csv` file containing the quantitative responses 
of the subject.

### Variables

sqr: subjective answers in quantitative terms

## Initial code structure

The current documentation may not be updated.

Brief structure is listed below:

| Metric | Input | Expected units | Variable name | Format | Data Example | Input file | information MAP |
|-|-|-|-|-|-|-|-|
| Questionaaire | subject response | Likert | sqr | String | 0 .. 4 | subject_xx_questionnaire_lowAssist | userInput>TedSR>inputFile |
|  | subject response | Likert | sqr | String | 0 .. 4 | subject_xx_questionnaire_medAssist | userInput>TedSR>inputFile |
|  | subject response | Likert | sqr | String | 0 .. 4 | subject_xx_questionnaire_highAssist | userInput>TedSR>inputFile |
|  | subject response | Likert | sqr | String | 0 .. 4 | subject_xx_questionnaire_noAssist | userInput>TedSR>inputFile |

Octave algorithm to obtain the quantitative analysing in terms of usability, impact and utility. The questions are designed in to address these three criterion. 

