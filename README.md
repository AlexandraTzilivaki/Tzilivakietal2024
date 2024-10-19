
Bimodal dendritic processing in basket cells drives distinct memory-related oscillations
--------------------------------------------------
INFORMATION/INSTRUCTIONS ABOUT THE SIMULATIONS AND CODES AND FIGURES GENERATION. 
--------------------------------------------------------------------------------

Dear Colleagues,

In this .txt file you can find detailed descriptions on the codes used in this work and information about how to run the simulations and generate all figures. 

Hope you will find them useful! 
Best wishes,

Alexandra Tzilivaki

In case you have any questions do not hesitate to contact me at : alexandra.tzilivaki@charite.de
--------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------

a)	Folders Description

1. Figures_Main_1_2_3

This folder contains ALL datasets used to generate the main paper graphs/figures (1,2,3) and the statistical analyses

To reproduce the results and statistics please open the MATLAB, load the data (the .mat file) and run the Figures_Main_1_2_3.m and Figure_Main_1_2_3_shadederrorbarsandtraces.m scripts


2. Figure_Suppl_1

This folder contains ALL datasets used to generate the Suppl_1 figure graphs and the statistical analyses

To reproduce the results and statistics please open the MATLAB, load the data (the .mat file) and run the figure_Suppl_1.m script

3. Figure_Suppl_2

This folder contains ALL datasets used to generate the Suppl_2 figure graphs and the statistical analyses

To reproduce the results and statistics please open the MATLAB, load the data (the .mat file) and run the figure_Suppl_2.m script
Please, note that there are 3 datasets which correspond to panels a-c , d-f , g-i respectively.


4. Figure_Suppl_3

This folder contains ALL datasets used to generate the Suppl_3 figure graphs and the statistical analyses

To reproduce the results and statistics please open the MATLAB, load the data (the .mat file) and run the figure_Suppl_3.m and figure_Suppl_3_shadederrorbarsandtraces.m scripts


5. Figure_Suppl_4

This folder contains ALL datasets used to generate the Suppl_4 figure graphs and the statistical analyses

To reproduce the results and statistics please open the MATLAB, load the data (the .mat file) and run the figure_Suppl_4.m and figure_Suppl_4_shadederrorbarsandtraces.m scripts


6. Figure_Suppl_5

This folder contains ALL datasets used to generate the Suppl_5 figure graphs and the statistical analyses

To reproduce the results and statistics please open the MATLAB, load the data (the .mat file) and run the plotmipac.m 


7.  mechanism

This file contains all the .mod files used to build the biophysical mechanisms of the neurons. For more information please read the methods of the paper. 
*** IMPORTANT*** 
After downloading the model, a successful compilation of the .mod files is needed in order to run the .hoc scripts in the experiment folder. 

How to compile the .mod files (please open a terminal e.g. in Linux and type):
>cd mechanism
>nrnivmodl

After successful compilation of the .mod files, a new folder entitled x86_64 will be created inside the mechanism folder. Please copy paste it in the experiment folder.

8. experiment

Contents:

Pyr.hoc 
---------      
Pyramidal neuron model



PVCompartmental.hoc & PVCompartmental2.hoc
------------------------------------------------   
PV FSBCs neuron models (each file corresponds to a different morphological reconstruction)



poisson_thetainput.py   
------------------------- 
Python script to generate theta modulated input (spike times). Please see the relevant readmeinput.txt the requirements.txt and the styles.txt for the information on the python libraries needed.


folders  fthetan300 and fthetan5hz250
---------------------------------------
These are the spike times generated from the poisson_thetainput.py . For all simulations shown in figures 1-3, Suppl 2 panels a-f, Suppl 3-5 the fthetan300 was used. For the Suppl2 panels g-i (input sensitivity analysis), the fthetan5hz250 was usd instead.




vecstimPyr.hoc
--------------
This code simulates the inputs to the pyramidal population



vecstimFSBC.hoc & vecstimFSBC_Inputsto_subsupra.hoc
--------------------
These codes simulate the inputs to the FSBCs population either during bimodal activation (use vecstimFSBC.hoc) or during Supralinear/Sublinear activation (use vecstimFSBC_Inputsto_subsupra.hoc)




dendir.hoc
----------
This code simultes current clamp protocol to calculate the dendritic input resistance

If you wish to run the code please open a terminal (e.g. for linux) and type:
>cd experiment
>nrngui dendir.hoc



fpap.hoc
----------
This code simultes current clamp protocol to calculate the forward propagation
If you wish to run the code please open a terminal (e.g. for linux) and type:
>cd experiment
>nrngui fpap.hoc



basic_graphics.hoc
-------------------
This file creates graphs while running NEURON simulations.



LFP.hoc
-------
This file is used the in silico LFP electrode



subhipp57.txt subhipp62.txt suprahipp57.txt suprahipp62.txt
--------
The nonlinearity ID (1 for supra 0 for sub) for every dendrite of every PV FBC reconstruction from Tzilivaki et al, 2019


folder helper_files
--------------
contains matlab scriptss for loading the neuron data etc



circuit.hoc
------------
Connectivity and synaptic paameters of the circuit. Synapses to FSBCs are activated in a bimodal way (see explanation of the protocol in tha paper)




circuit_inputstosubsupra.hoc
---------------------------
Connectivity and synaptic paameters of the circuit. Synapses to FSBCs are activated in a Supralinear (or Sublinear) way (see explanation of the protocol in tha paper)




run.hoc
-------
This code creates and runs the model network. Please, see the comments inside the code on how to run different protocols of activation.
If you wish to run the code please open a terminal (e.g. for linux) and type:
>cd experiment
>nrngui run.hoc

You can run the model (run.hoc) also with a bash script using the bashrun.sh instead. please note that this option doenst activate the NEURON interface.






p.s. interneurons are super great cells!


























