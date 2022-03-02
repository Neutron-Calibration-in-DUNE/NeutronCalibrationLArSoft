#!/bin/bash
RUN_NUMBER=0
NUM_EVENTS=50

lar -n $NUM_EVENTS \
    -c unet_reco.fcl \
    -T $NEUTRON_HISTS/reco_hist_$RUN_NUMBER.root \
    -o $NEUTRON_OUTPUTS/reco_$RUN_NUMBER.root \
    -s $NEUTRON_OUTPUTS/detsim_$RUN_NUMBER.root