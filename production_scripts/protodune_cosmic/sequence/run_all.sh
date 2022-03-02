#!/bin/bash

for i in {0..9}
do
    sed -e "s@REPLACE@$i@" < unet_generator.fcl > temp_generator.fcl
    lar -c temp_generator.fcl -o $DATA_DIR/generator_$i.root 
    lar -c unet_g4.fcl -o $DATA_DIR/g4_$i.root -s $DATA_DIR/generator_$i.root
    lar -c unet_extract.fcl -o $DATA_DIR/extract_$i.root -s $DATA_DIR/g4_$i.root
done