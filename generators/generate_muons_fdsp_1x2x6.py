"""
Script for generating single muons in the FDSP 1x2x6 geometry
"""
from particle_generator import generate_particle

num_events  = 10
init_pos    = [100., 100., 0.]
init_mom    = [0., 0., 1.]
energy      = 6.

# generate muons
generate_particle(
    num_events=num_events,
    pdg=13,
    init_pos=init_pos,
    init_mom=init_mom,
    energy=energy,
    output_file='../input_files/FDSP/1x2x6/muons/fdsp_1x2x6_single_muons.dat'
)