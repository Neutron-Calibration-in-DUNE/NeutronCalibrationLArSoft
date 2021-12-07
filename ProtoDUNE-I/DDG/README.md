# ProtoDUNE-I DDG Simulation
----------------------------

The scripts in this folder run the simulation for protodune using the DDG geometry.  The corresponding GDML file is in the geometry folder in the main directory of the repo.

### Generator Step
------------------

To run the simulation, you first need to go into the *generator* folder and run the *generate_neutrons_protodune-I.py* script with whatever settings you want to use -- by default the file uses the location of the DDG source from ProtoDUNE run I which was (355,630,60) in ProtoDUNE coordinates, as well as a mono-energetic beam of 2.5MeV which produces around 1450 neutrons per pulse.  In the scripts, one pulse is one event.

```bash
python generate_neutrons_protodune-I.py
```

The output should go into a folder called *dat/ProtoDUNE-I*.  Once this is complete, you can run the generator FHiCL file to create the initial LArSoft products.  The script can be found in *ProtoDUNE-I/DDG/*

```bash
lar -c protodune_ddg_generator.fcl
```

You may have to edit the generator script based on any changes you made to the generator python file.  The results are typically saved as *ProtoDUNE-I_<num_events>_<num_neutrons>.dat* where <num_events> is the number of events generated and <num_neutrons> is the number of neutrons per pulse (set initially to 1450).

### Geant4 Step
---------------

If the above step is successful, the next step is to run the Geant4 simulation with an updated gamma cascade model, which can be incorporated into any Geant4 run by using the physics list titled *MyQGSP_BERT_ArHP*, which is installed in the artg4tk library.  Provided you've updated the file *protodune_ddg_g4.fcl* with the appropriate input file names, the Geant4 step can be run by simply doing:

```bash
lar -c protodune_ddg_g4.fcl
```
