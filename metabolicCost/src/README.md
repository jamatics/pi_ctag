# metabolicCost

Code developed by CTAG, and optimized for Eurobench by CTAG on Tecnalia
proposal.

## Installation guidelines

Follow the upper [Readme](../README.md) indications.

## Description

### Abstract
This code developed in Octave demonstrates how to predict the metabolic rate 
in kilocalories (kcal) of a human being performing different tasks.

The current entry point is [computePI.m](computePI.m).

```octave
computePI("[path_to]/subject_xx_run_xx_chrono.csv",
"[path_to]/subject_xx_testbed_lowAssist.yaml", "[path_to]/")
```

The two parameters are:

- `subject_xx_run_xx_chrono.csv`: a `csv` file containing the time stamp raw
  data that is generated by the testbed. 

- 'subject_xx_testbed_lowAssist.yaml': a 'yaml' file that contails all the
  necessary user inputs to select the correct posture/sub posture to calculate
the metabolic cost in kcal. 

### Variables

bw: subject body weight in kilograms (kg) [user input in yaml file]

s: gender of the subject (1-male, 0-female) [user input in yaml file]

l: weigh of the load in kilograms (user input in yaml file)

h1: vertical height from floor, STARTING point for lift and END point for 
lower in meters (user input in yaml)

h2: Vertical height from floor, STARTING point for lift and END point for 
lower in meters (user input in yaml file)

v: speed of walking in meters per second (user input in yaml file)

x: horizontal movement of work piece in meters (user input in yaml file)

f: Average pushing/pulling force applied by hands in kilograms (user input in
file)

t:  Time in minutes (user input in yaml file)

g:  grade of the walking surface as a percentage (user input in yaml file)

opt1: User input to choose: 1. Maintenance of body posture or 2. Other tasks

opt1a: If user choose 1. Maintenance of body posture user must select one of the
following sub options: 1. Sitting or 2. Standing or 3. Standing and Bending

opt1a: if user chooses 2. Other tasks then user must select one of the following
22 options: 

1: Stoop lift or 

2: Squat lift or 

3: One hand lift or 

4: Arm lift or

5. Stoop lower or 

6. Squat lower or 

7. Arm lower or 

8. Walking or 

9. Carrying, loads held at arms length at sides (1 or 2 hands) or 

10. Carrying, loads held against thighs or against waist or 

11. Holding, at arms length, against thighs or at sides(2 hands) or 

12. Holding against waist or 

13. Holding, at arms length in one hand or 

14. Pushing/pulling, at bench height (0.8 meters) or 

15. Pushing/pulling, at 1.5 meters height or 

16. Lateral movement of arms of 180 degrees, 2 hands or 

17. Lateral movement of arms of 180 degrees, 1 hand or 

18. 90 degrees arms lateral movement, standing, 1 or 2 hands or 

19: 90 degrees arms lateral movement, sitting, 2 hands or 

20. 90 degrees arms lateral movement, sitting, 1 hand or 

21: Forward movement of arms, standing, 1 or 2 hands or 

22: Forward movement of arms, sitting, 1 or 2 hands

## Initial code structure

The current documentation may not be updated.

Brief structure is listed below:

| Metric | Input | Expected units | Variable name | Format | Data Example | Input file | Information MAP |
|-|-|-|-|-|-|-|-|
| Metabolic Cost | Case ID --> two main options: static body postures or dynamic body postures = 1 or 2 | Number (no units) | opt1 | String | 1 or 2 | subject_xx_testbed_ID.yaml | userInput>input file |
|  | Case ID --> 1 --> three options: 1, 2 or 3 Case ID --> 2 --> 22 options | Number (no units) | opt1a | String | 1 to 22 | subject_xx_testbed_ID.yaml | userinput>input_File |
|  | Heights | meters (m) | h1, h2 | Double | 0.5, 0.7, … | subject_xx_testbed_ID.yaml | userinput>input_File |
|  | Grade of the walking surface | percenteage (%) | g | Double | 5                                                 | subject_xx_testbed_ID.yaml | userinput>input_File |
|  | Body weight | kg (kilograms) | bw | Double | 75                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | subject_xx_testbed_ID.yaml | userinput>input_File |
|  | Exo weight | kg (kilograms) | ExW | Double | 3.5 | subject_xx_testbed_ID.yaml | userinput>input_File |
|  | Time | min (minutes) | t | Double | 0.5, 3, 59, 120 | subject_xx_run_xx_chorno.csv | proximitySensor>TestEd> nodeRed >rawData_T_TestID_RunNumber_timestamp.csv> preProcess>input_File |
|  | Frequency | hertz (Hz) | freq | Double | 0.5, 1, 2, 10 ... | subject_xx_run_xx_chorno.csv | controller>TestEd> nodeRed >rawData_T_TestID_RunNumber_timestamp.csv> preProcess>Input_File |
|  | Force | kilogram (kg) | f | Double | 20                                                                                                                                                                                                      | subject_xx_run_xx_metabolicCost.csv | loadCell>TestEd> nodeRed >rawData_T_TestID_RunNumber_timestamp.csv> preProcess>input_File |
|  | Horizontal movement of work piece in meters | meter (m) | x | Double | 0.1 | subject_xx_run_xx_metabolicCost.csv | loadCell>TestEd> nodeRed >rawData_T_TestID_RunNumber_timestamp.csv> preProcess>input_File |
|  | Speed | meters per second (m/s) | v | Double | 1.38 | subject_xx_run_xx_chrono.csv | proximitySensor>TestEd> nodeRed >rawData_T_TestID_RunNumber_timestamp.csv> preProcess>input_File |

Octave algorithm to obtain the metabolic cost of the task during both static and
dynamic tasks.
First we calculate the time of completion of the task.
Secondly the switch statement are used to select the opt1 casescand then 
we define two functions based on the static and dynamic tasks:
1. postureMaintain that calculates the metabolic cost based on body static 
postures. The function inputs are body weight and the Opt1a. 
2. otherTasks that calculates the metabolic cost nased on dynamic tasks. The
   function inputs all variables [see above] except opt1. 

## References
1. [Garg, A., Chaffin, D.B. and Herrin, G.D., 1978. Prediction of metabolic rates for manual materials handling jobs. American Industrial Hygiene Association Journal, 39(8), pp.661-674.](https://oeh.tandfonline.com/doi/abs/10.1080/0002889778507831)