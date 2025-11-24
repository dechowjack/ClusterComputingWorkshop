# Slurm SBATCH Directive Reference Sheet


| Directive                            | Purpose                  | Typical values / examples       | Notes & tips                                                                      |
| ------------------------------------ | ------------------------ | ------------------------------- | --------------------------------------------------------------------------------- |
| `#SBATCH -J` / `--job-name=`         | Name the job             | `-J myjob`                      | Shows in `squeue`, logs, emails. Keep it short.                                   |
| `#SBATCH -p` / `--partition=`        | Choose queue/partition   | `-p LocalQ`                     | Controls where the job can run; ask your cluster which partitions exist.          |
| `#SBATCH -t` / `--time=`             | Wall time limit          | `-t 00:30:00` (hh:mm:ss)        | Jobs are killed at limit; request slightly more than you expect.                  |
| `#SBATCH -N` / `--nodes=`            | Number of nodes          | `-N 1`                          | Multi-node jobs often need MPI; otherwise keep to 1.                              |
| `#SBATCH -n` / `--ntasks=`           | Total parallel tasks     | `-n 16`                         | For MPI or multiple `srun` tasks. Often paired with `--cpus-per-task`.            |
| `#SBATCH -c` / `--cpus-per-task=`    | Threads per task         | `-c 8`                          | For OpenMP/numba/BLAS-threaded codes. Set `OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK`. |
| `#SBATCH --ntasks-per-node=`         | Tasks per node           | `--ntasks-per-node=4`           | Helpful for multi-node placement control.                                         |
| `#SBATCH --mem=`                     | Memory per node          | `--mem=16G`                     | Mutually exclusive with `--mem-per-cpu`. Covers the whole node allocation.        |
| `#SBATCH --mem-per-cpu=`             | Memory per CPU           | `--mem-per-cpu=2G`              | Multiplies by total CPUs allocated. Good when scaling tasks.                      |
| `#SBATCH -o` / `--output=`           | STDOUT file              | `-o OUT/%x_%j.out`              | `%x`=job name, `%j`=job ID. Use directories you can write to.                     |
| `#SBATCH -e` / `--error=`            | STDERR file              | `-e OUT/%x_%j.err`              | Keep separate from `--output` for easier debugging.                               |
| `#SBATCH -D` / `--chdir=`            | Set working dir          | `-D /path/to/run`               | Equivalent to `cd` before job starts.                                             |
| `#SBATCH --mail-type=`               | Email on events          | `--mail-type=BEGIN,END,FAIL`    | Other options: `ALL`, `TIME_LIMIT`, `REQUEUE`, etc.                               |
| `#SBATCH --mail-user=`               | Email recipient          | `--mail-user=you@uni.edu`       | Must be a valid address; some clusters default to your account email.             |
| `#SBATCH -A` / `--account=`          | Charge account           | `-A proj123`                    | Required on centers with allocations.                                             |
| `#SBATCH --qos=`                     | Quality of service       | `--qos=normal`                  | Affects limits/priority if your site uses QoS.                                    |
| `#SBATCH --array=`                   | Job arrays               | `--array=0-99%10`               | `%10` throttles concurrency. Inside script use `$SLURM_ARRAY_TASK_ID`.            |
| `#SBATCH -d` / `--dependency=`       | Job dependencies         | `-d afterok:12345`              | Variants: `after`, `afterok`, `afternotok`, `afterany`, `singleton`.              |
| `#SBATCH --gres=`                    | Generic resources (GPUs) | `--gres=gpu:1`                  | Cluster-specific (e.g., `gpu:tesla:2`). Often requires GPU partition.             |
| `#SBATCH --constraint=`              | Node features            | `--constraint=rome&256G`        | Matches nodes with given features (labels vary by site).                          |
| `#SBATCH --exclusive`                | Exclusive node use       | `--exclusive`                   | You get the whole node(s); don’t combine with small `--mem` requests.             |
| `#SBATCH --hint=`                    | SMT/NUMA hint            | `--hint=nomultithread`          | May improve performance by disabling hyper-threads.                               |
| `#SBATCH --export=`                  | Env var export           | `--export=ALL,MYFLAG=1`         | `NONE` to block, or enumerate required vars explicitly.                           |
| `#SBATCH --signal=`                  | Send signal before kill  | `--signal=B:USR1@60`            | Send `SIGUSR1` 60s before preemption/time limit; add checkpoints.                 |
| `#SBATCH --requeue` / `--no-requeue` | Requeue on preempt/fail  | `--requeue`                     | Needs `--signal` + checkpointing to be useful.                                    |
| `#SBATCH --open-mode=`               | Output file mode         | `--open-mode=append`            | `truncate` (default) overwrites; `append` extends existing logs.                  |
| `#SBATCH --wrap=`                    | One-liner job            | `--wrap="python script.py"`     | Handy for quick tests without a script file.                                      |
| `#SBATCH --reservation=`             | Use reservation          | `--reservation=workshop`        | For scheduled training events or maintenance windows.                             |
| `#SBATCH --profile=`                 | Perf profiling           | `--profile=task`                | Site-dependent; may emit stats to `slurm.profiling` files.                        |
| `#SBATCH --nice=`                    | Lower priority           | `--nice=1000`                   | Useful when queue-friendly is preferred over speed.                               |
| `#SBATCH --begin=`                   | Deferred start           | `--begin=18:30` or `now+2hours` | Reserves spot to start at/after given time.                                       |
| `#SBATCH --hold` / `--nohold`        | Submit held              | `--hold`                        | Release later with `scontrol release <jobid>`.                                    |
| `#SBATCH --time-min=`                | Flexible runtime         | `--time-min=00:10:00`           | Lets backfill with shorter slot if full time not available.                       |
| `#SBATCH --tmp=`                     | Local scratch            | `--tmp=40G`                     | Requests node-local tmp space (if configured).                                    |
