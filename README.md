# NeutronCalibrationLArSoft

This repository contains the files necessary to run the LArSoft side of the neutron calibration effort for DUNE.  This includes calibration for the various far detector geometries, such as the 1x2x6 single phase and 1x6x6 vertical drift models.  It will also contain configuration files for running calibration on protoDUNE-I and II.  

## Install
#### Installing on FNAL with the installation script
To install on FNAL, there are a set of installation scripts included which will do the job for you.  First, log in to one of the dunebuildXX machines and choose a destination that you would like to put the files from this repository.  Then, simply clone the repository and run the setup script:
```console
$ git clone https://github.com/infophysics/NeutronCalibrationLArSoft.git
$ cd NeutronCalibrationLArSoft/scripts
$ source install_neutron_extractor.sh
```
this will set up a new custom dunetpc installation along with the NeutronExtractor module which is needed for getting truth information from the simulations.
