"""
Script for generating HEPevt format 
"""
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import axes3d
import csv

pdg_list = [
    11,
    13,
    22,
    2112,
    2212,
]

masses = {
    '11':   0.5110e-3,
    '13':   0.10565,
    '22':   0,
    '2112': 0.93956,
    '2212': 0.93827,
}

def calculate_momentum(
    pdg:    int,
    energy: float,
):
    return np.sqrt(energy**2 - masses[str(pdg)]**2)

def calculate_energy(
    pdg:    int,
    mom:    float,
):
    return np.sqrt(masses[str(pdg)]**2 + mom**2)

def check_consistency(
    pdg:    int,
    mom:    float,
    energy: float,
):
    diff = round(energy,4) - round(calculate_energy(pdg,mom),4)
    return (diff == 0)

def calculate_magnitude(
    mom:    list
):
    return np.sqrt(sum([p**2 for p in mom]))

def generate_particle(
    num_events:         int,
    pdg:                int,
    init_pos:           list,
    init_mom:           list,
    momentum_magnitude: float=-1.,
    energy:             float=-1.,
    output_file:        str='hepevt.dat',
) -> None:
    """
    Generate particles with pdg code.
    """
    if (momentum_magnitude < 0 and energy < 0):
        raise ValueError("ERROR! Either momentum magnitude or energy must be specified!")
    if len(init_pos) != 3:
        raise ValueError(f"ERROR! Initial position must be a list of three values not {init_pos}.")
    if len(init_mom) != 3:
        raise ValueError(f"ERROR! Initial momentum must be a list of three values not {init_mom}.")
    if calculate_magnitude(init_mom) != 1:
        raise ValueError(f"ERROR! Initial momentum must be a unit vector not {init_mom}.")
    if pdg not in pdg_list:
        raise ValueError(f"ERROR! Pdg code {pdg} not in list {pdg_list}.")
    if momentum_magnitude < 0:
        # set momentum using pdg and energy
        if energy < masses[str(pdg)]:
            raise ValueError(f"ERROR! Energy must be at least the mass of the particle: {masses[str(pdg)]}, not {energy}.")
        momentum_magnitude = calculate_momentum(pdg, energy)
    elif energy < 0:
        # set energy using
        energy = calculate_energy(pdg, momentum_magnitude)
    else:
        # check for consistency
        if not check_consistency(pdg, momentum_magnitude, energy):
            raise ValueError(f"ERROR! Inconsistent values of energy: {energy} and momentum: {momentum_magnitude} for pdg: {pdg}.")
    # set initial momentum
    mom = [p * momentum_magnitude for p in init_mom]
    # iterate over number of events
    events = []
    for ii in range(num_events):
        # insert event header for HEPevt format
        events.append([str(ii) + " 1"])
        hepevt_string = "1 "                        # particle status (final state)
        hepevt_string += str(pdg) + " "             # pdg code 
        hepevt_string += "0 0 0 0 "                 # 1st, 2nd mother and 1st, 2nd daughter
        hepevt_string += str(mom[0]) + " "          # px in GeV
        hepevt_string += str(mom[1]) + " "          # py in GeV
        hepevt_string += str(mom[2]) + " "          # pz in GeV
        hepevt_string += str(energy) + " "          # total energy (E^2 = m^2 + p^2)
        hepevt_string += str(masses[str(pdg)]) + " "# mass 
        hepevt_string += str(init_pos[0]) + " "     # x position in G4 coordinates
        hepevt_string += str(init_pos[1]) + " "     # y position in G4 coordinates
        hepevt_string += str(init_pos[2]) + " "     # z position in G4 coordinates
        hepevt_string += "0"                        # production time (not needed)
        events.append([hepevt_string])
    # save output to a file
    with open(output_file,"w") as file:
        writer = csv.writer(file,delimiter="\t")
        writer.writerows(events)