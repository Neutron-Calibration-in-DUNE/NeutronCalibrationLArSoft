# generate_neutrons_fdsp.py
"""
    Code for generating neutrons for neutron calibration studies
    in a sphere of argon.
    Nicholas Carrara [ncarrara.physics@gmail.com]   -   09/29/2021


"""
import PNS_generator

if __name__ == "__main__":
    # DDG mono-energetic total energy
    # (same as the settings for protoDUNE)
    energy      = .942065
    # (same as the settings for protoDUNE)
    momentum_magnitude = 0.0685863
    # center of the sphere
    x_pos = 0       
    y_pos = 0       
    z_pos = 0
    # number of events to generate
    num_events = 10000
    # number of neutrons to generate per event
    num_neutrons = 1
    # output file name
    output_file = "../dat/ArgonSphere/ArgonSphere_"+str(num_events)+"_"+str(num_neutrons)+".dat"

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
        False)

