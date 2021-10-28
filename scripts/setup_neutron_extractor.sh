#! /bin/bash
CURRENT_DIR=$PWD
INSTALL_DIRECTORY=/dune/app/users/$USER/NeutronCalibrationLArSoft
LARSOFT_VERSION=v09_31_00
DUNETPC_VERSION=$LARSOFT_VERSION
ARTG4TK_VERSION=v10_03_00
QUALS=e20:prof

source /cvmfs/dune.opensciencegrid.org/products/dune/setup_dune.sh
setup ninja
cd $INSTALL_DIRECTORY
source localProducts*/setup
mrbslp

cd $CURRENT_DIR

