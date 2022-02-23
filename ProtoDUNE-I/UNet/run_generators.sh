#!/bin/bash
DATA_DIR=/pnfs/dune/scratch/users/$USER/protodune_cosmic/
mkdir -p DATA_DIR

for i in {0..9}
do
    sed -e "s@REPLACE@$i@" < unet_generator.fcl > temp_generator.fcl
    lar -c unet_generator.fcl -o DATA_DIR/generator_$i.root 
done