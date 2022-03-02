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
setup ninja
cd $INSTALL_DIRECTORY
source localProducts*/setup
mrbslp

cd $MRB_SOURCE/dunetpc/dune/ParticleExtractor
git pull

ninja -C $MRB_BUILDDIR -j 32 install

export GEOMETRY_PATH=$NEUTRON_CALIBRATION_DIR/geometry/
export ARGON_SPHERE_PATH=$NEUTRON_CALIBRATION_DIR/fcl/argon_sphere/
export FDSP_1x2x6_PATH=$NEUTRON_CALIBRATION_DIR/fcl/fd_1x2x6/
export PROTODUNE_PATH=$NEUTRON_CALIBRATION_DIR/fcl/protodune
export PROTODUNE_UNET_PATH=$NEUTRON_CALIBRATION_DIR/fcl/protodune/unet
export DATA_PATH=/pnfs/dune/scratch/users/$USER/
mkdir -p $DATA_PATH/dat/protodune
#mkdir -p $PROTODUNE_PATH/ddg/outputs/
export NEUTRON_OUTPUTS=$DATA_PATH/outputs
mkdir -p $NEUTRON_OUTPUTS
export NEUTRON_HISTS=$DATA_PATH/hists
mkdir -p $NEUTRON_HISTS

# setup geometry file path
export FW_SEARCH_PATH="$FW_SEARCH_PATH:$GEOMETRY_PATH"
export FHICL_FILE_PATH="$FHICL_FILE_PATH:$GEOMETRY_PATH:$ARGON_SPHERE_PATH:$FDSP_PATH:$FDSP_1x2x6_PATH:$FDVD_PATH:$PROTODUNE_PATH:$PROTODUNE_UNET_PATH"

cp $GEOMETRY_PATH/geometry_dune.fcl $MRB_INSTALL/dunetpc/$LARSOFT_VERSION/job/
cd $NEUTRON_CALIBRATION_DIR
