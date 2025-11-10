#!/bin/bash
# Helper script to deal with file permission issues
# Must run from $HOME directory (or adjust HOME paths below)

# Absolute scratch path (either the real path, or use the workdir symlink)
tmpdir="/not_backed_up/jldechow"            # real path behind the symlink

src_file="$HOME/ClusterComputingWorkshop/ExampleScripts/test_add.py"
job_file="$HOME/ClusterComputingWorkshop/ExampleJobs/test_add.job"

# Make sure target dirs exist
mkdir -p "$tmpdir"
mkdir -p "$HOME/OUT"

# Stage the python file to scratch and show contents
cd "$tmpdir"                    # Move to work dir
pwd                             #Print current dir
ls -l                           #List workdir contents
cp -f "$src_file" "$tmpdir/"    # Copy script to workdir
cp -f "$job_file" "$tmpdir/"    # Copy job file to workdir
ls -l                           #list again

# Submit the job FROM scratch so $SLURM_SUBMIT_DIR == $tmpdir
# Pass absolute path to the script we just staged
sbatch test_add.job test_add.py 5 8
sleep 30
pwd
cat result.txt
cp result.txt "$HOME/"
