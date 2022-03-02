#!/bin/bash
RUN_NUMBER=0
NUM_EVENTS=50

lar -n $NUM_EVENTS \
    -c unet_generator.fcl \
    -T $NEUTRON_HISTS/generator_hist_$RUN_NUMBER.root \
    -o $NEUTRON_OUTPUTS/generator_$RUN_NUMBER.root \
    -s $DATA_DIR/dat/protodune/protodune_50_1450_$RUN_NUMBER.dat