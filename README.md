
Folder includes:
------

**The interpretation code:**
apply_samples.py
util.py

**Plot code:**
plots_final.py 

**Sample input data:** segwayOutput

Segway output for test samples.

**Sample output:** testworkdir


Includes classifier output and diagnostic plots from the apply_samples.py, for test samples.

Note
------
apply_samples.py includes the plot code itself. Lenght_Distribution plots take a bit of time (we can skip it if that's a problem at this stage)


Command line run: 

apply_samples.py can be run from within the main directory with no modifications. 

In the segwayOutput folder, each sample has its own folder with files feature_aggregation.tab and signal_distribution.tab, which are needed for the classifier. The folder segwayOutput also has the file trackname_assays.txt, required for the classifier. 
For the plot section of the code, for each sample the files segment_sizes.tab and length_distribution.tab are read from the folder glob-a287da44f32bf6a3fc6d7c51c52ddafa. 



