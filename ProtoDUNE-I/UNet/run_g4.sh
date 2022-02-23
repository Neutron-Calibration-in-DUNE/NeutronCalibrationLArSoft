#!/bin/bash
DATA_DIR=/pnfs/dune/scratch/users/$USER/protodune_cosmic/
mkdir -p $DATA_DIR

for i in {0..9}
do
    lar -c unet_g4.fcl -o $DATA_DIR/g4_$i.root -s $DATA_DIR/generator_$i.root
done