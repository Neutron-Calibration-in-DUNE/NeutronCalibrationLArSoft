#! /bin/bash
# set up all of the folder structure

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
NEUTRON_CALIBRATION_DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )/../"

export INSTALL_DIRECTORY=$NEUTRON_CALIBRATION_DIR/larsoft
export LARSOFT_VERSION=v09_31_00
export DUNETPC_VERSION=$LARSOFT_VERSION
export ARTG4TK_VERSION=v10_03_00
export QUALS=e20:prof

export GEOMETRY_PATH=$NEUTRON_CALIBRATION_DIR/geometry/
export ARGON_SPHERE_PATH=$NEUTRON_CALIBRATION_DIR/fcl/argon_sphere/
export FDSP_1x2x6_PATH=$NEUTRON_CALIBRATION_DIR/fcl/fd_1x2x6/
export ProtoDUNE_PATH=$NEUTRON_CALIBRATION_DIR/fcl/protodune
mkdir -p $NEUTRON_CALIBRATION_DIR/dat/protodune
mkdir -p $ProtoDUNE_PATH/ddg/outputs/

# setup geometry file path
export FW_SEARCH_PATH="$FW_SEARCH_PATH:$GEOMETRY_PATH"
export FHICL_FILE_PATH="$FHICL_FILE_PATH:$GEOMETRY_PATH:$ARGON_SPHERE_PATH:$FDSP_PATH:$FDSP_1x2x6_PATH:$FDVD_PATH:$ProtoDUNE_PATH"