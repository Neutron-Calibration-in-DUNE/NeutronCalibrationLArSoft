#!/bin/bash

for i in {0..9}
do
    lar -c unet_extract.fcl -o $DATA_DIR/extract_$i.root -s $DATA_DIR/g4_$i.root
done