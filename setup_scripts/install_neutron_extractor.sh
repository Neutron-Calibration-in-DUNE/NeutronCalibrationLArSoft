#! /bin/bash
# get the directory where this script is stored
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
NEUTRON_CALIBRATION_DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )/../"

INSTALL_DIRECTORY=$NEUTRON_CALIBRATION_DIR/larsoft
LARSOFT_VERSION=v09_31_00
DUNETPC_VERSION=$LARSOFT_VERSION
ARTG4TK_VERSION=v10_03_00
QUALS=e20:prof

source /cvmfs/dune.opensciencegrid.org/products/dune/setup_dune.sh
setup larsoft $LARSOFT_VERSION -q $QUALS
setup ninja

mkdir -p $INSTALL_DIRECTORY
cd $INSTALL_DIRECTORY

mrb newDev
source localProducts*/setup

cd $MRB_SOURCE
mrb g -t $DUNETPC_VERSION dunetpc
cd dunetpc/dune/

git clone https://github.com/UC-Davis-Machine-Learning/ParticleExtractor

sed -i '$ a add_subdirectory(ParticleExtractor)' CMakeLists.txt

cd $MRB_BUILDDIR
mrbsetenv
mrb install -j 32 --generator ninja

GEOMETRY_PATH=$NEUTRON_CALIBRATION_DIR/geometry/
ARGON_SPHERE_PATH=$NEUTRON_CALIBRATION_DIR/fcl/argon_sphere/
FDSP_1x2x6_PATH=$NEUTRON_CALIBRATION_DIR/fcl/fd_1x2x6/
ProtoDUNE_PATH=$NEUTRON_CALIBRATION_DIR/fcl/protodune
mkdir -p $NEUTRON_CALIBRATION_DIR/dat/protodune
mkdir -p $ProtoDUNE_PATH/ddg/outputs/

# setup geometry file path
export FW_SEARCH_PATH="$FW_SEARCH_PATH:$GEOMETRY_PATH"
export FHICL_FILE_PATH="$FHICL_FILE_PATH:$GEOMETRY_PATH:$ARGON_SPHERE_PATH:$FDSP_PATH:$FDSP_1x2x6_PATH:$FDVD_PATH:$ProtoDUNE_PATH:"

cp $GEOMETRY_PATH/geometry_dune.fcl $MRB_INSTALL/dunetpc/$LARSOFT_VERSION/job/

cd $NEUTRON_CALIBRATION_DIR