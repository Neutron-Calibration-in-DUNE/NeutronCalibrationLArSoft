#!/bin/bash
DATA_DIR=/pnfs/dune/scratch/users/$USER/protodune_cosmic/
mkdir -p $DATA_DIR

for i in {0..9}
do
    lar -c unet_extract.fcl -o $DATA_DIR/extract_output.root -s $DATA_DIR/g4_output.root
done