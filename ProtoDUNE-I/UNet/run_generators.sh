#!/bin/bash
DATA_DIR=/pnfs/dune/scratch/users/$USER/protodune_cosmic/
mkdir -p DATA_DIR

for i in {0..9}
do
    lar -c unet_generator.fcl -o DATA_DIR/generator_$i.root -s ../../dat/ProtoDUNE-I/ProtoDUNE-I_50_1450_$i.dat
done