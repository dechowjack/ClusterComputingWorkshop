# UNC Cluster Computing Workshop - Slurm
## 1. What is SLURM?
`Simple Linux Utility for Resource Management` or `Slurm` for short is a job scheduling software used on HPC clusters. The primary job of Slurm is to manage and allocate resources between many users. It decides when jobs start, allocates the correct resources for a job, and tracks resources to make sure every job uses distinct GPUs and CPUs.

## 2. What is a job?
A job is any shell script i.e. `job.sh` that contains lines of code that specify:
    - How many resources you need for your job
    - What exactly you want to run
    - Where to send the results of the job

Slurm jobs start with a `shebang`, a line of code that tells the computer what language your script is written in, and what interpreter it is written in. There are several shell scripting languages, but the most common is `bash`. The bash `shebang` looks like this: `#!/bin/bash`. When writing a job script, the first line should always be the `shebang`. Below is an example job script

```bash
#!/bin/bash
#SBATCH -J testjob          
#SBATCH -p LocalQ          
#SBATCH -t 00:10:00         
#SBATCH --ntasks=1         

echo "Hello from Slurm!"
```
This job script starts with the shebang `#!/bin/bash` that tells the computer we are working in `bash`. The next four lines contain lines of code that look like comments, but are actually called `directives` and are part of `slurm`. Normally, any line in a `bash` script that starts with `#` would be interpeted as a comment and not run. But with the `#SBATCH` directive, it is still seen by `slurm` and interpeted as a config command. Let's break these down

`#SBATCH -J testjob`         This tells `slurm` to name the job `testjob`
`#SBATCH -p LocalQ`          This tells `slurm` with partition to run on
`#SBATCH -t 00:10:00`        This gives a the job a time limit of 10 minutes
`#SBATCH --ntasks=1`         This requests a single CPU core

Assuming everything works, this job should mirror the functionality of typing `echo "Hello from Slurm!"` in the command line.

## 3. Basic Slurm Commands
Much like the generic command line utilities discussed in P1, slurm has its own commands that you can use to start, check on, or cancel jobs. Below we will show the most common and useful ones

| Command         | Purpose                                                  |
| --------------- | -------------------------------------------------------- |
| `sbatch job.sh` | Submit a batch job script to the queue                   |
| `srun`          | Run a job or command interactively or within a script    |
| `squeue`        | Check the queue and see what jobs are running or pending |
| `scancel JOBID` | Cancel a queued or running job                           |
| `sinfo`         | View partitions, node status, and resource availability  |

Some of these commands are more useful with flags. For example, lets say I wanted to check every job I've submitted that is currently running or waiting in the queue. Instead of running `squeue`, which would show every job on the entire cluster, I could run `squeue -u jldechow`. The `-u` flag tells slurm to report all jobs tied to user `jldechow`. Similarly, if I accidently submitted multiple jobs, or even just didn't keep track of the `$JOBID` for all my jobs, I could cancel all my jobs using `scancel -u jldechow`.