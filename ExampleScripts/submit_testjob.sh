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
cp -f "$src_file" "$tmpdir/"
cd "$tmpdir"
ls -l

# Submit the job FROM scratch so $SLURM_SUBMIT_DIR == $tmpdir
# Pass absolute path to the script we just staged
sbatch "$job_file" "$tmpdir/test_add.py" 5 8

rm "$tmpdir/test_add.py"
cp ./OUT/* "$HOME/OUT/"
