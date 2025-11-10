# UNC Cluster Computing Workshop - Slurm
## 1. Introduction
The examples shown in `P2_Slurm` are simple jobs that only use basic UNIX commands. However, cluster computing is really about utilizing the large amount of compute resources to run complex or computationally expensive programs. In this section, we will go through how to run more complex jobs.

### 1.1 Running software on the command line
When you are in the command line environment, you can't just call a file name and have it run. For example, assume we have a `python` script named `test_add.py`. This file is available in the main repo, and is a simple python script that takes two inputs `a` and `b` and then adds the results and prints them to a file `result.txt`. If I try to run `test_add.py` on the command line I get the following error:

```bash
jldechow@river:~/scratch$ test_add.py 5 8
test_add.py: command not found
```

The error `test_add.py: command not found` is due to the fact the system interprets `test_add.py` as a `bash` command, not a `python` command. To fix this, we instead run:

```bash
jldechow@river:~/scratch$ python3 test_add.py 5 8
Adding 5 + 8 = 13
```

Here the `python3` command in the `bash` command line is similar to the `shebang` discussed earlier. In spoken language, it goes like this: using the command `python3`, the `bash` terminal expects the next input `test_add.py` to be a `python` script. If this script didn't require anymore arguments, that would just run as is. Since `test_add.py` expects two more arguments (the intergers we will add together), we give those two arguments after we call the script itself.