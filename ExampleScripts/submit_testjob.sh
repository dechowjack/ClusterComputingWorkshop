#!/bin/bash

# Helper script to deal with file permission issues
# Must run from $HOME directory

# Assign paths
tmpdir="not_backed_up/jldechow/"
src_file="$HOME/ClusterComputingWorkshop/ExampleScripts/test_add.py"

# Move files
cp $src_file $tmpdir
cd $tmpdir
ls

# Run job script
sbatch "$HOME/ClusterComputingWorkshop/ExampleJobs/test_add.job" test_add.py 5 8

