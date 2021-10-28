# generate_neutrons_vd.py
"""
    Code for generating neutrons for neutron calibration studies
    in the vertical detector.
    Nicholas Carrara [ncarrara.physics@gmail.com]   -   09/29/2021


"""
import PNS_generator

# vertical drift 1x6x6 coordinates
# center of the active volume
x_center = 0
y_center = 0
z_center = 700
# center on top of the cryostat
x_cryo   = 0
y_cryo   = 700
z_cryo   = 700
# forward right corner
x_corner = 175
y_corner = 700
z_corner = 140


if __name__ == "__main__":
    # DDG mono-energetic total energy
    # (same as the settings for protoDUNE)
    energy      = .942065
    # (same as the settings for protoDUNE)
    momentum_magnitude = 0.0685863
    x_pos = x_center     
    y_pos = y_center
    z_pos = z_center     
    # number of events to generate
    num_events = 500
    # number of neutrons to generate per event
    num_neutrons = 1450
    # output file name
    output_file = "../dat/FDVD/FDVD_1x6x6_"+str(num_events)+"_"+str(num_neutrons)+".dat"

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
        True)

