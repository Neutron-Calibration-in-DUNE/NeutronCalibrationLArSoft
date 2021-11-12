#! /bin/bash
# set up all of the folder structure

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
NEUTRON_CALIBRATION_DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )/../"

mkdir -p $NEUTRON_CALIBRATION_DIR/input_files/FDSP/1x2x6/simple_tests/
mkdir -p $NEUTRON_CALIBRATION_DIR/input_files/FDVD/1x6x6/simple_tests/

mkdir -p $NEUTRON_CALIBRATION_DIR/FDSP/1x2x6/hists
mkdir -p $NEUTRON_CALIBRATION_DIR/FDSP/1x2x6/outputs
mkdir -p $NEUTRON_CALIBRATION_DIR/FDSP/1x2x6/simple_tests/hists
mkdir -p $NEUTRON_CALIBRATION_DIR/FDSP/1x2x6/simple_tests/outputs

mkdir -p $NEUTRON_CALIBRATION_DIR/FDVD/1x6x6/hists
mkdir -p $NEUTRON_CALIBRATION_DIR/FDVD/1x6x6/outputs
mkdir -p $NEUTRON_CALIBRATION_DIR/FDVD/1x6x6/simple_tests/hists
mkdir -p $NEUTRON_CALIBRATION_DIR/FDVD/1x6x6/simple_tests/outputs

mkdir -p $NEUTRON_CALIBRATION_DIR/ProtoDUNE-I/DDG/hists
mkdir -p $NEUTRON_CALIBRATION_DIR/ProtoDUNE-I/DDG/outputs
mkdir -p $NEUTRON_CALIBRATION_DIR/ProtoDUNE-I/DDG/simple_tests/hists
mkdir -p $NEUTRON_CALIBRATION_DIR/ProtoDUNE-I/DDG/simple_tests/outputs
