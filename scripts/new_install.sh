#!/bin/sh
#! /bin/bash
# get the directory where this script is stored
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
NEUTRON_CALIBRATION_DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )/../"

COMPILER=e20
DIRECTORY=NeutronCalibrationInstall
USERNAME=`whoami`
HDIR=/dune/app/users
#HDIR=/build

source /cvmfs/dune.opensciencegrid.org/products/dune/setup_dune.sh
cd ${HDIR}/${USERNAME}
touch ${DIRECTORY}
rm -rf ${DIRECTORY}
mkdir ${DIRECTORY}
cd ${DIRECTORY}
mrb newDev -q ${COMPILER}:prof
source ${HDIR}/${USERNAME}/${DIRECTORY}/localProducts*/setup
mkdir work
cd srcs

# checks out the develop versions of the split repositories
# use the -t <tag> option to check out a specific tag
# you can use mrb g dune_suite to get all the code below plus duneutil

mrb g dunecore
mrb g duneopdet
mrb g dunesim
mrb g dunecalib
mrb g duneprototypes
mrb g dunedataprep
mrb g dunereco
mrb g duneana
mrb g duneexamples
mrb g protoduneana
mrb g dunesw
#mrb uc

cd $MRB_SOURCE/duneana/duneana/
git clone https://github.com/Neutron-Calibration-in-DUNE/NeutronExtractor
sed -i '$ a add_subdirectory(NeutronExtractor)' CMakeLists.txt

mrb uc
cd $MRB_BUILDDIR
mrbsetenv

# build the software stack.  Use -j<n> where n is the number of cores on the machine.
# using <n> too large (such as 16 on a dunegpvm machine), will run the computer out of memory
# the dune build nodes have 16 cores and enough memory to run the build with -j16

mrb i -j16

GEOMETRY_PATH=$NEUTRON_CALIBRATION_DIR/geometry/
ARGON_SPHERE_PATH=$NEUTRON_CALIBRATION_DIR/ArgonSphere/
FDSP_PATH=$NEUTRON_CALIBRATION_DIR/FDSP
FDSP_1x2x6__PATH=$NEUTRON_CALIBRATION_DIR/FDSP/1x2x6/
FDVD_PATH=$NEUTRON_CALIBRATION_DIR/FDVD
ProtoDUNE_PATH=$NEUTRON_CALIBRATION_DIR/ProtoDUNE-I
mkdir -p $NEUTRON_CALIBRATION_DIR/dat/ProtoDUNE-I
mkdir -p $ProtoDUNE_PATH/DDG/outputs/

# setup geometry file path
export FW_SEARCH_PATH="$FW_SEARCH_PATH:$GEOMETRY_PATH"
export FHICL_FILE_PATH="$FHICL_FILE_PATH:$GEOMETRY_PATH:$ARGON_SPHERE_PATH:$FDSP_PATH:$FDSP_1x2x6_PATH:$FDVD_PATH:$ProtoDUNE_PATH"


cd $NEUTRON_CALIBRATION_DIR
