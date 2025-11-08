# Linux + Slurm Commands Reference Sheet
## Help + Manual

Nearly every command accepts `command --help` as a flag. This gives a quick summary of options and usage. Likewise, `man command` opens the full manual entry for a command.

## Basic Linux Commands

| **Command** | **Purpose**             | **Example Usage**                                        | **Explanation**                                              |
| ----------- | ----------------------- | -------------------------------------------------------- | ------------------------------------------------------------ |
| `cd`        | Change directory        | `cd ./documents`                                         | Moves you into another folder.                               |
| `pwd`       | Print working directory | `pwd`                                                    | Shows the full path of your current location.                |
| `ls`        | List directory contents | `ls -a`                                                  | Lists all files/folders (`-a` shows hidden files).           |
| `mv`        | Move or rename files    | `mv file.txt /otherFolder/`<br>`mv file.txt newFile.txt` | Moves or renames a file.                                     |
| `cp`        | Copy files              | `cp file.txt copy_of_file.txt`                           | Makes a duplicate of a file.                                 |
| `mkdir`     | Make directory          | `mkdir newFolder`                                        | Creates a new folder.                                        |
| `cat`       | View file contents      | `cat file.txt`                                           | Displays the contents of a file.                             |
| `touch`     | Create/update file      | `touch newfile.txt`                                      | Creates a blank file or updates an existing one’s timestamp. |
| `rm`        | Remove files/folders    | `rm file.txt`<br>`rm -r folder/`                         | Deletes a file or folder (cannot be undone).                 |

## Common Slurm Commands

| **Command** | **Purpose**                      | **Example Usage**          | **Explanation**                                |
| ----------- | -------------------------------- | -------------------------- | ---------------------------------------------- |
| `sbatch`    | Submit a job script              | `sbatch myjob.slurm`       | Sends a job script to the queue for execution. |
| `squeue`    | View the job queue               | `squeue -u $USER`          | Shows jobs running or waiting (for your user). |
| `scancel`   | Cancel a job                     | `scancel 12345`            | Stops a specific job.                          |
| `sinfo`     | View cluster status              | `sinfo`                    | Displays node/partition availability.          |
| `srun`      | Run interactively or in parallel | `srun hostname`            | Runs a command directly through Slurm.         |
| `sacct`     | View job history                 | `sacct -j 12345`           | Shows usage and stats for completed jobs.      |
| `scontrol`  | Inspect/modify job info          | `scontrol show job 12345`  | Displays detailed job information.             |
| `salloc`    | Start an interactive session     | `salloc -t 01:00:00 -n 1`  | Reserves resources for live testing.           |
| `module`    | Load software environments       | `module load julia`        | Loads pre-installed software on the cluster.   |
| `ssh`       | Connect to remote system         | `ssh username@cluster.edu` | Securely logs in to the cluster’s login node.  |
