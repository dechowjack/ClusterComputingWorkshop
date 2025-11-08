# UNC Cluster Computing Workshop - Slurm
## 1. What is SLURM?
The `Simple Linux Utility for Resource Management` or `Slurm` for short, is a job scheduling software used on HPC clusters. The primary job of Slurm is to manage and allocate resources between many users. It decides when jobs start, allocates the correct resources for a job, and tracks resources to make sure every job uses distinct GPUs and CPUs.

## 2. What is a job?
A job is any shell script i.e. `job.sh` that contains lines of code that specify:
1. How many resources you need for your job
2. What exactly you want to run
3. Where to send the results of the job

Slurm jobs start with a `shebang`, a line of code that tells the computer what language your script is written in, and what interpreter the computer should use to read the script. There are several shell scripting languages, but the most common is `bash`. The bash `shebang` is: `#!/bin/bash`. Below is an example job script

```bash
#!/bin/bash
#SBATCH -J testjob          
#SBATCH -p LocalQ          
#SBATCH -t 00:10:00         
#SBATCH --ntasks=1         

echo "Hello from Slurm!"
```
This job script starts with the shebang `#!/bin/bash` that tells the computer we are working in `bash`. Every job script script should start with the `shebang`. The next four lines contain lines of code that look like comments, but are actually called `directives` and are part of `slurm`. Normally, any line in a `bash` script that starts with `#` would be interpeted as a comment and not run. But with the `#SBATCH` directive, it is still seen by `slurm` and interpeted as a config command. Let's break these down

- `#SBATCH -J testjob`         This tells `slurm` to name the job `testjob`
- `#SBATCH -p LocalQ`          This tells `slurm` with partition to run on
- `#SBATCH -t 00:10:00`        This gives a the job a time limit of 10 minutes
- `#SBATCH --ntasks=1`         This requests a single CPU core

Assuming everything works, this job should mirror the functionality of typing `echo "Hello from Slurm!"` in the command line.

## 3. Basic Slurm Commands
Much like the generic command line utilities discussed in P1, slurm has its own commands that you can use to start, check on, or cancel jobs. Below we will show the most common and useful ones

| **Command** | **Purpose**                                | **Example Usage**                     | **Explanation**                                                          |
| ----------- | ------------------------------------------ | ------------------------------------- | ------------------------------------------------------------------------ |
| `sbatch`    | Submit a job script to the queue           | `sbatch myjob.sh`                     | Sends your job script to Slurm to run when resources are available.      |
| `squeue`    | View the job queue                         | `squeue -u $USER`                     | Shows which jobs are running or waiting (for your user or everyone).     |
| `scancel`   | Cancel a running or pending job            | `scancel 12345`                       | Stops the job with ID `12345`                                            |
| `sinfo`     | View node and partition (queue) status     | `sinfo`                               | Displays what parts of the cluster are available, busy, or down.         |
| `srun`      | Run a command interactively or in parallel | `srun hostname`                       | Starts a command directly through Slurm (often used inside job scripts). |
| `sacct`     | View job history and resource usage        | `sacct -j 12345`                      | Shows runtime, CPU, and memory use for a finished job.                   |
| `module`    | Load software environments                 | `module load julia`                   | Loads software packages or environments available on the cluster.        |
| `ssh`       | Connect to remote servers or nodes         | `ssh user@cluster.edu`                | Connects securely to the cluster login node                              |

Many cluster commands become much more useful when paired with flags, which are options that modify behavior. For example, running `squeue`will show every job on the entire cluster, which often is not very useful.To see only your own jobs, you can add the `-u` flag followed by your username:`squeue -u jldechow`. Here, `-u` means `user`, so this command lists all jobs currently running or waiting that belong to user `jldechow`. Similarly, if you accidentally submit several jobs or lose track of your job IDs, you can cancel all your jobs at once with `scancel -u jldechow`. This tells Slurm to stop every job associated with user `jldechow`, saving you from hunting down each individual `$JOBID`.
