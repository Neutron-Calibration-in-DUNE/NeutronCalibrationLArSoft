#!/bin/bash
#! /bin/bash
# get the directory where this script is stored
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
NEUTRON_CALIBRATION_DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )/../"

NUM_JOBS=1
MEMORY=1800MB
DISK=2GB
TIME=3h
CPU=3
USAGE=DEDICATED,OPPORTUNISTIC,OFFSITE
TAR=dropbox://$NEUTRON_CALIBRATION_DIR/scripts/neutron_calibration.tar.gz

jobsub_submit -G dune -M -N $NUM_JOBS --memory=$MEMORY --disk=$DISK --expected-lifetime=$TIME --cpu=$CPU --resource-provides=usage_model=$USAGE --tar_file_name=$TAR --use-cvmfs-dropbox -l '+SingularityImage=\"/cvmfs/singularity.opensciencegrid.org/fermilab/fnal-wn-sl7:latest\"' --append_condor_requirements='(TARGET.HAS_Singularity==true&&
TARGET.HAS_CVMFS_dune_opensciencegrid_org==true&&
TARGET.HAS_CVMFS_larsoft_opensciencegrid_org==true&&
TARGET.CVMFS_dune_opensciencegrid_org_REVISION>=1105&&
TARGET.HAS_CVMFS_fifeuser1_opensciencegrid_org==true&&
TARGET.HAS_CVMFS_fifeuser2_opensciencegrid_org==true&&
TARGET.HAS_CVMFS_fifeuser3_opensciencegrid_org==true&&
TARGET.HAS_CVMFS_fifeuser4_opensciencegrid_org==true)' file:///dune/app/users/kherner/run_May2021tutorial.sh