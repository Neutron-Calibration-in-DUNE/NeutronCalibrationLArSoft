#!/bin/bash
RUN_NUMBER=0
NUM_EVENTS=50
INPUT_FILE=$NEUTRON_CALIBRATION_DIR/dat/protodune/protodune_50_1450_$RUN_NUMBER.dat

sed -e "s@REPLACE@$INPUT_FILE@" < $PROTODUNE_UNET_DIR/unet_generator.fcl > $PROTODUNE_UNET_DIR/temp_generator_$RUN_NUMBER.fcl

lar -n $NUM_EVENTS \
    -c $PROTODUNE_UNET_DIR/temp_generator_$RUN_NUMBER.fcl \
    -T $NEUTRON_HISTS/generator_hist_$RUN_NUMBER.root \
    -o $NEUTRON_OUTPUTS/generator_$RUN_NUMBER.root