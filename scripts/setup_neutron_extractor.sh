#! /bin/bash
INSTALL_DIRECTORY   = /dune/app/users/$USER/NeutronCalibrationLArSoft

source /cvmfs/dune.opensciencegrid.org/products/dune/setup_dune.sh
source $INSTALL_DIRECTORY/localProducts*/setup
mrbslp

export FHICL_FILE_PATH="$PWD../fcl:$PWD../ArgonSphere:$PWD../FDSP:$PWD../FDVD:$PWD../protoDUNE-I:$PWD../protoDUNE-II:$FHICL_FILE_PATH"
export FW_SEARCH_PATH="$PWD../geometry:$FW_SEARCH_PATH"