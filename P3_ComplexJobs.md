# UNC Cluster Computing Workshop - Slurm
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

# Ensure OUT directory exists
os.makedirs("OUT", exist_ok=True)

# Write result to file
with open("OUT/result.txt", "w") as f:
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
To avoid running on the head node, we instead will run software through job scripts. 