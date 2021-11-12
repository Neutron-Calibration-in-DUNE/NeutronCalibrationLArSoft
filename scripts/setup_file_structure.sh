#! /bin/bash
# set up all of the folder structure

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
NEUTRON_CALIBRATION_DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )/../"

mkdir -p NEUTRON_CALIBRATION_DIR/input_files

FDSP_FOLDER=NEUTRON_CALIBRATION_DIR/FDSP
1x2x6_FOLDER=NEUTRON_CALIBRATION_DIR/FDSP/1x2x6
mkdir -p FDSP_FOLDER
mkdir -p 1x2x6_FOLDER
mkdir -p 1x2x6_FOLDER/hists
mkdir -p 1x2x6_FOLDER/outputs
mkdir -p 1x2x6_FOLDER/simple_tests
mkdir -p 1x2x6_FOLDER/simple_tests/hists
mkdir -p 1x2x6_FOLDER/simple_tests/outputs

FDVD_FOLDER=NEUTRON_CALIBRATION_DIR/FDVD
1x6x6_FOLDER=NEUTRON_CALIBRATION_DIR/FDVD/1x6x6
mkdir -p FDVD_FOLDER
mkdir -p 1x6x6_FOLDER
mkdir -p 1x6x6_FOLDER/hists
mkdir -p 1x6x6_FOLDER/outputs
mkdir -p 1x6x6_FOLDER/simple_tests
mkdir -p 1x6x6_FOLDER/simple_tests/hists
mkdir -p 1x6x6_FOLDER/simple_tests/outputs

ProtoDUNE-I_FOLDER=NEUTRON_CALIBRATION_DIR/ProtoDUNE-I
DDG_FOLDER=NEUTRON_CALIBRATION_DIR/ProtoDUNE-I/DDG
mkdir -p ProtoDUNE-I_FOLDER
mkdir -p DDG_FOLDER
mkdir -p DDG_FOLDER/hists
mkdir -p DDG_FOLDER/outputs
mkdir -p DDG_FOLDER/simple_tests
mkdir -p DDG_FOLDER/simple_tests/hists
mkdir -p DDG_FOLDER/simple_tests/outputs
