# balance

[![license - apache 2.0](https://img.shields.io/:license-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Copyright CTAG 2020

It is prepared under TestEd project to be used within the Eurobench Benchmarking Software.

## Purposes

**TO be detailed.**

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
./run_pi_balance testdata/input/balance.csv testdata/input/testbed_lowAssist.yaml outdir
```

with:

- `balance.csv`: a `csv` file containing the 3d ground reaction forces from left and right hand side force plate, assuming the first column is a timestamp in second.

- `testbed_lowAssist.yaml`: yaml file containing testbed configuration data related to the industrial use-case.

### Borg scale

Assuming folder `outdir` exists:

```shell
./run_pi_borgScale10 testdata/input/questionnaire_borgScale10.csv outdir
```

with:

- `questionnaire_borgScale10.csv`: _to be described_

**TO BE DETAILED**

### chrono

**TO BE DETAILED**

Assuming folder `outdir` exists:

```shell
./run_pi_chrono testdata/input/chrono.csv outdir
```

with:

- `chrono.csv`: _to be defined_

### hrMonitoring

**TO BE DETAILED**

Assuming folder `outdir` exists:

```shell
./run_pi_hrMonitoring testdata/input/hrv.csv outdir
```

### metabolic cost

**TO BE DETAILED**

Assuming folder `outdir` exists:

```shell
./run_pi_metabolicCost testdata/input/chrono.csv testdata/input/testbed_lowAssist_metaboliccost.yaml outdir
```

### questionnaire

**TO BE DETAILED**

Assuming folder `outdir` exists:

```shell
./run_pi_questionnaire testdata/input/questionnaire_medAssist.csv outdir
```

### range of Motion

**TO BE DETAILED**

Assuming folder `outdir` exists:

```shell
./run_pi_rangeofMotion testdata/input/jointAngles.csv outdir
```

## Build docker image

_tested under linux_

Run the following command in order to create the docker image for this PI:

```console
docker build . -t pi_ctag
```

## Launch the docker image

Assuming the `testdata/input/` contains the input data, and that the directory `test_data/output/` is created, and will contain the PI output:

```shell

docker run --rm -v $PWD/testdata/input:/in -v $PWD/output:/out pi_ctag ./run_pi_balance /in/balance.csv /in/testbed_lowAssist.yaml /out
docker run --rm -v $PWD/testdata/input:/in -v $PWD/output:/out pi_ctag ./run_pi_borgScale10 /in/questionnaire_borgScale10.csv /out
docker run --rm -v $PWD/testdata/input:/in -v $PWD/output:/out pi_ctag ./run_pi_chrono /in/chrono.csv /out
docker run --rm -v $PWD/testdata/input:/in -v $PWD/output:/out pi_ctag ./run_pi_hrMonitoring /in/hrv.csv /out
docker run --rm -v $PWD/testdata/input:/in -v $PWD/output:/out pi_ctag ./run_pi_metabolicCost /in/chrono.csv /in/testbed_lowAssist_metaboliccost.yaml /out
docker run --rm -v $PWD/testdata/input:/in -v $PWD/output:/out pi_ctag ./run_pi_questionnaire /in/questionnaire_medAssist.csv /out
docker run --rm -v $PWD/testdata/input:/in -v $PWD/output:/out pi_ctag ./run_pi_rangeofMotion /in/jointAngles.csv /out

```

## Acknowledgements

<a href="http://eurobench2020.eu">
  <img src="http://eurobench2020.eu/wp-content/uploads/2018/06/cropped-logoweb.png"
       alt="rosin_logo" height="60" >
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
