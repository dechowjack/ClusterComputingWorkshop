# Slurm Exit Code Reference Sheet
Below is a reference sheet for common slurm job exit codes, their meaning, and common causes.

## Generic Exit Codes
| **Exit Code** | **Meaning / Interpretation**          | **Typical Cause**                                                      |
| ------------- | ------------------------------------- | ---------------------------------------------------------------------- |
| `0`           | **Success**                           | Job completed normally with no errors.                                 |
| `1`           | General failure                       | A generic error returned by script or program.                         |
| `2`           | Misuse of shell builtins              | Incorrect script syntax or bad shell command.                          |
| `3–124`       | Program-specific failure              | Error code returned by application (check program docs).               |
| `125`         | Reserved by SLURM for *out of memory* | Often indicates job was killed for exceeding memory                    |
| `126`         | Cannot execute command                | Program not executable or bad permissions.                             |
| `127`         | Command not found                     | Executable not found in PATH.                                          |
| `128`         | Invalid argument to exit              | Happens if exit call uses invalid value.                               |
| `129–255`     | **Signal termination**                | Job was terminated by a Unix signal; subtract 128 to get signal number |



## Signal Termination Codes
| **Exit Code** | **Signal**   | **Signal Meaning**          |
| ------------- | ------------ | --------------------------- |
| `129`         | SIGHUP (1)   | Hangup (e.g., shell closed) |
| `130`         | SIGINT (2)   | Interrupt (Ctrl-C)          |
| `131`         | SIGQUIT (3)  | Quit with core dump         |
| `132`         | SIGILL (4)   | Illegal instruction         |
| `134`         | SIGABRT (6)  | Abort                       |
| `136`         | SIGFPE (8)   | Floating point exception    |
| `137`         | SIGKILL (9)  | Job killed                  |
| `139`         | SIGSEGV (11) | Segmentation fault          |
| `143`         | SIGTERM (15) | Termination request         |
