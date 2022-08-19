# generate_neutrons_fdsp.py
"""
    Code for generating neutrons for neutron calibration studies
    in the far detector.
    Nicholas Carrara [ncarrara.physics@gmail.com]   -   09/29/2021


"""
import os
import sys
sys.path.append("../")
import PNS_generator

# 1x2x6 coordinates
# center of the active volume
x_center = 0
y_center = 303.5
z_center = 347.747
# ddg location
x_ddg = 355
y_ddg = 630
z_ddg = 60

output_dir = "../../inputs/protodune/"
if not os.path.isdir(output_dir):
    os.makedirs(output_dir)

if __name__ == "__main__":
    # DDG mono-energetic total energy
    # (same as the settings for protoDUNE)
    energy = .939566
    # (same as the settings for protoDUNE)
    momentum_magnitude = 0.00137018136 # 1 keV
    x_pos = -150       
    y_pos = y_center
    z_pos = z_center  
    # number of events to generate
    num_events = 10
    # number of neutrons to generate per event
    num_neutrons = 1
    # output file name
    num_files = 1
    
    for ii in range(num_files):
        output_file = f"{output_dir}protodune_{num_events}_{num_neutrons}_{ii}.dat"
        PNS_generator.generate_ddg_neutrons(
            num_events, 
            num_neutrons, 
            momentum_magnitude, 
            energy, 
            x_pos, 
            y_pos, 
            z_pos, 
            output_file, 
            False,
            False
        )

