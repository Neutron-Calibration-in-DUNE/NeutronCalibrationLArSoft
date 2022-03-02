#!/bin/bash
RUN_NUMBER=0
NUM_EVENTS=50

lar -n $NUM_EVENTS \
    -c unet_g4.fcl \
    -T $NEUTRON_HISTS/g4_hist_$RUN_NUMBER.root \
    -o $NEUTRON_OUTPUTS/g4_$RUN_NUMBER.root \
    -s $NEUTRON_OUTPUTS/generator_$RUN_NUMBER.root