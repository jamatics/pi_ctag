# balance

[![license - apache 2.0](https://img.shields.io/:license-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Copyright CTAG 2020

It is prepared under TestEd project to be used within the Eurobench Benchmarking Software.

## Purposes

Measuring the performance (Balance, Borg Scale, Chrono, HR Monitoring, Metabolic Cost, Questionnaire, Range of Motion) of a human subject wearing industrial exoskeleton and completing an industrial task.

## Installation

**TO BE UPDATED**

To enable the code under octave, additional packages are needed.

```console
sudo apt-get install liboctave-dev
```

Follow [these recommendations](https://octave.org/doc/v4.2.1/Installing-and-Removing-Packages.html) to make the installation of the additional packages needed:

- [signal](https://octave.sourceforge.io/signal/index.html)
- [mapping](https://octave.sourceforge.io/mapping/index.html)
- [statistics](https://octave.sourceforge.io/statistics/index.html)

Once octave is configured:

```console
pkg load signal
pkg load mapping
pkg load statistics
```

Note that all these installation steps can be run following the `RUN` command of the [Dockerfile](Dockerfile):

```shell
sh ./install.sh
wget -O statistics-1.4.1.tar.gz https://octave.sourceforge.io/download.php?package=statistics-1.4.1.tar.gz \
wget -O signal-1.4.1.tar.gz https://octave.sourceforge.io/download.php?package=signal-1.4.1.tar.gz \
wget -O mapping-1.2.1.tar.gz https://octave.sourceforge.io/download.php?package=mapping-1.2.1.tar.gz
./package_install.m
```

## Usage

The repository gives access to a set of performance metrics.

### Balance

More detailed in [balance](balance/README.md).

To compute the Dynamic Posture Stability Index (DPSI), assuming that the folder `outdir` is already created:

```shell
./run_pi_balance testdata/input/balance.csv testdata/input/subject_xx_info.yaml outdir
```

with:

- `balance.csv`: a `csv` file containing the 3d ground reaction forces from left and right hand side force plate, assuming the first column is a timestamp in second.

- `subject_xx_info.yaml`: yaml file containing the subjective information such as height, weight, gender, etc.

### Borg scale

More detailed in [borgScale](borgScale10/README.md).

To compute the Borg Scale, assuming that the folder `outdir` exists:

```shell
./run_pi_borgScale10 testdata/input/questionnaire_borgScale10.csv outdir
```

with:

- `questionnaire_borgScale10.csv`: a 'csv' file consists of subject respond with the rating of perceived exertions (RPE) with revised category-ratio scale (0-10).

### chrono

More detailed in [chrono](chrono/README.md).

Assuming folder `outdir` exists:

```shell
./run_pi_chrono testdata/input/chrono.csv outdir
```

with:

- `chrono.csv`: a 'csv' file generated by the testbed position sensors that contains the timestamp data of subject entry and exist from the testbed for each run.

### hrMonitoring

More detailed in [hrMonitoring](hrMonitoring/README.md).

Assuming folder `outdir` exists:

```shell
./run_pi_hrMonitoring testdata/input/hrv.csv outdir
```

with:

- `hrv.csv`: a 'csv' file generated by the portable wearable device such as Polar H10 that consists of single column Heart Rate Variability (HRV).

### metabolic cost

More detailed in [metabolicCost](metabolicCost/README.md).

Assuming folder `outdir` exists:

```shell
./run_pi_metabolicCost testdata/input/chrono.csv testdata/input/subject_xx_info.yaml testdata/input/condition.yaml testdata/input/subject_xx_choice_metabolicCost.yaml outdir
```

with:

- `chrono.csv`: a 'csv' file generated by the testbed position sensors that contains the timestamp data of subject entry and exist from the testbed for each run.

- `subject_xx_info.yaml`: yaml file containing the subjective information such as height, weight, gender, etc.

- `condition.yaml`: yaml file containing testbed configuration data related to the industrial use-case.

- `subject_xx_choice_metabolicCost.yaml`: yaml file containing the user choices for the algorithm.

### questionnaire

More detailed in [questionnaire](questionnaire/README.md).

Assuming folder `outdir` exists:

```shell
./run_pi_questionnaire testdata/input/questionnaire_xxxAssist.csv outdir
```

with:

`questionnaire_xxxAssist.csv`: a csv file consisting of post test subjective responses.

### range of Motion

More detailed in [rangeofMotion](rangeofMotion/README.md).

Assuming folder `outdir` exists:

```shell
./run_pi_rangeofMotion testdata/input/jointAngles.csv outdir
```

with:

`jointAngles.csv`: a csv file containing time series joint angle for the human body joints.

## Build docker image

_tested under linux_

Run the following command in order to create the docker image for this PI:

```console
docker build . -t pi_ctag
```

## Launch the docker image

Assuming the `testdata/input/` contains the input data, and that the directory `test_data/output/` is created, and will contain the PI output:

```shell

docker run --rm -v $PWD/testdata/input:/in -v $PWD/output:/out pi_ctag ./run_pi_balance /in/balance.csv /in/subject_01_info.yaml /out
docker run --rm -v $PWD/testdata/input:/in -v $PWD/output:/out pi_ctag ./run_pi_borgScale10 /in/questionnaire_borgScale10.csv /out
docker run --rm -v $PWD/testdata/input:/in -v $PWD/output:/out pi_ctag ./run_pi_chrono /in/chrono.csv /out
docker run --rm -v $PWD/testdata/input:/in -v $PWD/output:/out pi_ctag ./run_pi_hrMonitoring /in/hrv.csv /out
docker run --rm -v $PWD/testdata/input:/in -v $PWD/output:/out pi_ctag ./run_pi_metabolicCost /in/chrono.csv /in/subject_01_info.yaml /in/condition.yaml /in/subject_01_choice_metabolicCost.yaml /out
docker run --rm -v $PWD/testdata/input:/in -v $PWD/output:/out pi_ctag ./run_pi_questionnaire /in/questionnaire_medAssist.csv /out
docker run --rm -v $PWD/testdata/input:/in -v $PWD/output:/out pi_ctag ./run_pi_rangeofMotion /in/jointAngles.csv /out

```

## Conversion of raw data into pre-processed format

_to be adjusted_

This folder consists of two sub-folders: 1. rawData and 2. input.
The rawData folder consists of seven sub-folders which must be populated with the data files based on the data population sequence mentioned in the filename of the folder.
The filename also contains the data source.

Procedure

1. Copy the raw data in the respective folder on the basis of the instructions present in the folder name.
   For example: `balance_EB_runWise = PI_source_populationSequence`.
   Please note that all the files in the rawData folder are in original form except balance and rangeofMotion folder files which are dependent on the EB facilities.
2. Change the file name and heading to comply with Eurobench (EB) Documentation (this step can be performed manually or automated with the help of bash scripts).

Following are the files and corresponding preprocessing required for EB ready:

1. `balance_EB_runWise/S1R1.txt`: Received from the EB force plate
   - Convert to csv format-> renaming to `subject_X_cond_Y_run_Z_balance.csv`
   - Insert header at the top of the file: `timestamp,left_force_x,left_force_y,left_force_z,left_torque_x,left_torque_y,left_torque_z,right_force_x,right_force_y,right_force_z right_torque_x,right_torque_y,right_torque_z`
   - Copy the preprocessed file to EB input folder.

2. `borgScale10_TestEd_testSessionWise/questionnaire_borgScale10.csv`: Received from the TestEd application
    - rename to `subject_X_cond_Y_run_Z_questionnaire_borgScale10.csv`
    - Copy the preprocessed file to EB input folder.

3. `chrono_TestEd_runWise/rawData_testID_RunNumber_Date_StartTime.csv`: Received from the TestEd application
   - rename to `subject_X_cond_Y_run_Z_chrono.csv`
   - copy the preprocessed file to EB input folder.

4. `hrMonitoring_PolarH10_runWise/date time.txt`: downloaded from the polar mobile application
   - Convert to the csv format
   - Insert header at the top of the file: `hrv`
   - Rename to `subject_X_cond_Y_run_Z_hrv.csv`
   - Copy the preprocessed file to EB input folder.

5. `questionnaire_TestEd_testSessionWise/questionnaireX_narrow_run.csv`: Received from the TestEd application
   - Rename to `subject_X_cond_Y_run_Z_questionnaire_ABC.csv`
   - Copy the preprocessed file to EB input folder.

6. `rangeofMotion_EB_runWise/jointAngle.csv/txt`: Received from the EB force plate
   - convert file to csv format
   - rename to `subject_X_cond_Y_run_Z_jointAngle.csv`
   - Insert header at the top of the file: `timestamp, r_hip_z, r_hip_x, r_hip_y,r_knee_z, r_knee_x, r_knee_y, r_ankle_z, r_ankle_x, r_ankle_y, l_hip_z, l_hip_x, l_hip_y, l_knee_z, l_knee_x, l_knee_y, l_ankle_z, l_ankle_x, l_ankle_y, pelvis_z, pelvis_x,  pelvis_y,  r_forearm,  lumbar_z, r_forearm/lumbar_x, r_forearm/lumbar_y, l_forearm/lumbar_z,l_forearm/lumbar_x,l_forearm/lumbar_y`
   - Copy the preprocessed file to EB input folder.

7. `input/subject_X_info.yaml`
   - Populate or create subjectwise with `subject_weight: X` and `gender: Y`.

8. `input/condition_X.yaml`
   - Populate or create testbed conditions by inserting: `assistance_level, number_runs, number_subjects, force, height1, height2, load, velocity, horizontalMovement, slope` (for details see the Git hub documentation).

9. `input/subject_X_cond_Y_choice_metabolicCost.yaml`
   - Populate or create this file for the subjective choice relevant to the testbed testing condition by inserting: `mainOption1, subOption1, mainOption2, subOption2, mainOption3, subOption3` (for details see the Git hub documentation)

## Acknowledgements

<a href="http://eurobench2020.eu">
  <img src="http://eurobench2020.eu/wp-content/uploads/2018/06/cropped-logoweb.png"
       alt="eurobench_logo" height="60" >
</a>

Supported by Eurobench - the European robotic platform for bipedal locomotion benchmarking.
More information: [Eurobench website][eurobench_website]

<img src="http://eurobench2020.eu/wp-content/uploads/2018/02/euflag.png"
     alt="eu_flag" width="100" align="left" >

This project has received funding from the European Union’s Horizon 2020
research and innovation programme under grant agreement no. 779963.

The opinions and arguments expressed reflect only the author‘s view and
reflect in no way the European Commission‘s opinions.
The European Commission is not responsible for any use that may be made
of the information it contains.

[eurobench_logo]: http://eurobench2020.eu/wp-content/uploads/2018/06/cropped-logoweb.png
[eurobench_website]: http://eurobench2020.eu "Go to website"
