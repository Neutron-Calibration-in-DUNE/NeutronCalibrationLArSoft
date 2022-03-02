#!/bin/bash
RUN_NUMBER=0
NUM_EVENTS=50

lar -n $NUM_EVENTS \
    -c unet_detsim.fcl \
    -T $NEUTRON_HISTS/detsim_hist_$RUN_NUMBER.root \
    -o $NEUTRON_OUTPUTS/detsim_$RUN_NUMBER.root \
    -s $NEUTRON_OUTPUTS/g4_$RUN_NUMBER.root