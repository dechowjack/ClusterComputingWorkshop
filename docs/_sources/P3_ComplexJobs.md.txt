# UNC CCW - Complex Jobs in Slurm
## 1. Introduction
The examples shown in `P2_Slurm` are simple jobs that only use basic UNIX commands. However, cluster computing is really about utilizing the large amount of compute resources to run complex or computationally expensive programs. In this section, we will go through how to run more complex jobs.

### 1.1 Running software on the command line
When you are in the command line environment, you can't just call a file name and have it run. For example, assume we have a `python` script named `test_add.py`. This file is available in the main repo, and is a simple python script that takes two inputs `a` and `b` and then adds the results and prints them to a file `result.txt`. Below is the code for `test_add.py`

```python
#!/usr/bin/env python3
import sys
import os

# Read input arguments 
try:
    a = int(sys.argv[1])
    b = int(sys.argv[2])
except ValueError:
    print("Error: both arguments must be integers.")
    sys.exit(1)

result = a + b
print(f"Adding {a} + {b} = {result}")

# Write results
with open("result.txt", "w") as f:
    f.write(f"{a} + {b} = {result}\n")
```

Hopefully, the comments in the script are self-explanatory. Now, let's try to run it. If I run `test_add.py` on the command line I get the following error:

```bash
jldechow@river:~/scratch$ test_add.py 5 8
test_add.py: command not found
```

The error `test_add.py: command not found` is due to the fact the system interprets `test_add.py` as a `bash` command, not a `python` command. To fix this, we instead run:

```bash
jldechow@river:~/scratch$ python3 test_add.py 5 8
Adding 5 + 8 = 13
```

Here the `python3` command in the `bash` command line is similar to the `shebang` discussed earlier. In spoken language, it goes like this: using the command `python3`, the `bash` terminal expects the next input `test_add.py` to be a `python` script. If this script didn't require anymore arguments, that would just run as is. Since `test_add.py` expects two more arguments (the intergers we will add together), we give those two arguments after we call the script itself. The `python` script printed to output to the command line, as well as wrote to a file `result.txt` in the folder `OUT/`. Let's check that out.

```bash
jldechow@river:~/scratch$ python3 test_add.py 5 8
Adding 5 + 8 = 13
jldechow@river:~/scratch$ ls
OUT  test_add.py
jldechow@river:~/scratch$ ls OUT/
result.txt
jldechow@river:~/scratch$ cat OUT/result.txt
5 + 8 = 13
jldechow@river:~/scratch$ 
```
Since we are running the in my scratch directory, the script made the `OUT/` directory inside the `scratch` directory. If we wanted out script to write to a different output folder, i.e. `~/OUT/`, we would need to specify that explicitly. When running in the command line environment, folder creation and output write is relatively to the folder you are CURRENTLY in when you execute scripts. 

### 1.2 Running software on the head node
In the previous example, when we ran `test_add.py` from the command line we didn't use `slurm` to request any resources. This is called running on the `head node`. Normally, you would only want to do this for a very small/simple job that doesn't require many resources. The `head node` refers to the (usually) small amount of resources `slurm` has allocated to handle the `overhead` of running the entire server/cluster. So, the `head node` has a very small amount of resources available to it, and using them directly impacts the performance of the cluster for all users.

### 1.3 Running software in job scripts
To avoid running on the head node, we instead will run software through job scripts. Normally, you would call a script/program directly through a job script. This is not true on the `River` cluster currently due to file permission setup. Instead, we are going to do it in two stages: First, with a job submission script, and the actual job script second. Let's start with the submission script. You can find this in `ExampleScripts/submit_testjob.sh`:

```bash
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
rm result.txt
rm test_add.job
rm test_add.py
```

Again, hopefully the comments in this script are self explanatory. But in short, we run this script to avoid the issue with permissions in `slurm`. All of the moving and copying happens in the `shell` script as opposed to the job script. First, we copy all the files to our working directory `not_backed_up/jldechow`. Then, we run the actual job script with `sbatch test_add.job test_add.py 5 8`. Here, the first argument `test_add.job` is the name of the job script. The enxt three arguements `test_add.py` `5` and `8` are inputs to the job script. Finally, we copy of output of the job script to our home directory, and remove the files we copied to the working directory. Let's take a look at the job script now:

```bash
#!/bin/bash
#SBATCH -J test_add_job
#SBATCH -p LocalQ
#SBATCH -t 00:05:00
#SBATCH --ntasks=1
#SBATCH --mem=1G
#SBATCH -o OUT/%x_%j.out
#SBATCH -e OUT/%x_%j.err
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=jldechow@unc.edu

set -x

# Args:
#   $1 = absolute path to test_add.py
#   $2 = first integer
#   $3 = second integer
python3 "$1" "$2" "$3" > result.txt

echo "Job done: $SLURM_JOB_NAME ($SLURM_JOB_ID)"
```

The first 10 lines of this script are the `shebang` followed by the `slurm directives`. The next line is `set -x` which is a `bash` debugging flag that writes all following inputs/outputs to the output file `OUT/%x_%j.out`. Next, we run our python script with `python3 "$1" "$2" "$3" > result.txt`. Thhis does the following:

- `python3`				: run this code with `python3`
- `"$1" "$2" "$3"`		: use the first three input arguments
- `> result.txt`		: write the outputs to the file `results.txt`

Given that our three inputs are `test_add.py` `5` and `8`, this line really looks like:

`python3 test_add.py 5= 8 > result.txt`

Which tells the cluster to run `test_add.py` with inputs `5` and `8`, which will add them together.