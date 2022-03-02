#!/bin/bash

for i in {0..9}
do
    sed -e "s@REPLACE@$i@" < unet_generator.fcl > temp_generator.fcl
    lar -c temp_generator.fcl -o $DATA_DIR/generator_$i.root 
done