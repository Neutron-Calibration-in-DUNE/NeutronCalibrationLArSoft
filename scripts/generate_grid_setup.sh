#! /bin/bash
# get the directory where this script is stored
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
NEUTRON_CALIBRATION_DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )/../"

INSTALL_DIRECTORY=/dune/app/users/$USER/NeutronCalibrationInstall
LARSOFT_VERSION=v09_31_00
DUNETPC_VERSION=$LARSOFT_VERSION
ARTG4TK_VERSION=v10_03_00
QUALS=e20:prof

#cp $INSTALL_DIRECTORY/local*/setup $NEUTRON_CALIBRATION_DIR/scripts/setup-grid.sh
sed -e "s@/dune/app/users/$USER/@\$\{INPUT_TAR_DIR_LOCAL\}/@" < $INSTALL_DIRECTORY/local*/setup > $NEUTRON_CALIBRATION_DIR/scripts/setup-grid.sh
tar --exclude '.git' -czf neutron_calibration.tar.gz $MRB_INSTALL $MRB_TOP/work $NEUTRON_CALIBRATION_DIR/scripts/run_grid_job.sh