# UNC Cluster Computing Workshop - Basics
## 1. Basics of cluster computing
### 1.1 What is a cluster?
Cluster typically refers to a remote machine - i.e. *not* your local computer - that a user connects to using command line utilities. These machines have more logical CPU cores, RAM, VRAM, and storage available than the computers most people use. Multiple users can simultaneously access a cluster at once, and request a portion of the available resources to run programs. The benefit of running your work on a cluster is: 

  1. Clusters can run complex programs faster than a local machine
  2. Running on a cluster frees up resources on your local machine to allow you to run visualization scripts, write, etc without impacting the runtime of your programs.

### 1.2 UNIX basics
Clusters generally run on an operating system derived from the UNIX family of operating systems. The most widely know UNIX-like OS is probably MacOS. There are many differences between Windows and UNIX-like operating systems, but the two most applicable to the average user are:

1. UNIX based systems have a native *command line interface* or CLI. On MacOS, this is the *terminal* application. There is not a native CLI on Windows, and instead applications like *PuTTY* add CLI to Windows machines.
2. When looking at file paths, UNIX systems use a forward slash / to indicate directory level, while Windows uses back slash \ to indicate file paths. This is only an issue if copy-pasting file paths.

Separate from these, the interface with the cluster is entirely in the CLI. There is not a graphical user interface (GUI). 

### 1.3 Basic command line operations
In your day to day life on an OS with a GUI, things like copy-paste or changing directories is a clicking-based operation. In reality, when you highlight then copy-paste text, your OS is running the CLI operations that correspond to what you’ve clicked. These operations are usually done in a language called *bash*. Below, I will list common bash commands that help with everyday use on the clusters

| **Command** | **Purpose**             | **Example Usage**                                          | **Explanation**                                                                           |
| ----------- | ----------------------- | ---------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| `cd`        | Change directory        | `cd ./documents`                                           | Moves you into another folder (like double-clicking a folder in Finder or File Explorer). |
| `pwd`       | Print working directory | `pwd`                                                      | Shows the full path of where you are in the file system.                                  |
| `ls`        | List directory contents | `ls -a`                                                    | Lists all files and folders in the current directory (`-a` shows hidden files too).       |
| `mv`        | Move or rename files    | `mv file.txt /otherFolder/` <br> `mv file.txt newFile.txt` | Moves a file to another folder, or renames it.                                            |
| `cp`        | Copy files              | `cp file.txt copy_of_file.txt`                             | Makes a duplicate of a file.                                                              |
| `mkdir`     | Make a new directory    | `mkdir newFolder`                                          | Creates a new folder.                                                                     |
| `cat`       | View file contents      | `cat file.txt`                                             | Prints the contents of a file directly to the screen.                                     |
| `touch`     | Create or update a file | `touch newfile.txt`                                        | Creates a blank file (or updates the timestamp if it already exists).                     |
| `rm`        | Remove files or folders | `rm file.txt` <br> `rm -r folder/`                         | Deletes files (`rm`) or entire folders (`rm -r`). Use carefully—this cannot be undone!    |


### 1.4 Example command line interactions
Below is a example of using these operations on the command line

```bash
jldechow@Jacks-MBP Data % pwd
/Users/jldechow/Data
jldechow@Jacks-MBP Data % cd SWOT 
jldechow@Jacks-MBP SWOT % ls -ltrh
total 0
drwxr-xr-x  15 jldechow  staff   480B Jun 12 13:48 TuolumneMeadows
drwxr-xr-x  19 jldechow  staff   608B Jun 18 11:20 ZipFiles
drwxr-xr-x  12 jldechow  staff   384B Jun 18 11:22 LakeObs
drwxr-xr-x   7 jldechow  staff   224B Nov  7 13:47 Archive
```

In this example, we have used `pwd` to determine we are in the directory `/Users/jldechow/Data`. Next, we use `cd` to move to the directory `/Users/jldechow/Data/SWOT`. Finally, we use `ls` to see everything in the `SWOT` directory. The characters `-ltrh` after `ls` are called *flags*. Flags are used to turn on/off specific options for commands. Flags usually need to be in any specific order. In this example, the flags did the following:

`-l` output format LONG
`-t` list files by newest time first
`-r` output reverse order 
`-h` human readable format

Next, let’s use some other commands to make a test file and move it around.

```bash
jldechow@Jacks-MBP SWOT % touch test.txt              
jldechow@Jacks-MBP SWOT % echo "Hello world" > test.txt
jldechow@Jacks-MBP SWOT % cat test.txt              
Hello world
```

Let’s break this down line-by-line. First, we used `touch test.txt` to make an empty plain text file named `test.txt`. Next we used a more complicated set of commands involving `echo` and the redirection operator `>`. On its own, `echo “hello world”` would print “hello world” to the command line. When used in combination with the redirection operator the command `echo "Hello world" > test.txt` prints “hello world” *into* the file named `test.txt`. Finally, `cat test.txt` prints the contents of the file `test.txt` to the command line.

Now, let’s make a copy of this file and move it to a new directory. 

```bash
jldechow@Jacks-MBP SWOT % cp test.txt test2.txt
jldechow@Jacks-MBP SWOT % ls
Archive		test.txt	TuolumneMeadows
LakeObs		test2.txt	ZipFiles
jldechow@Jacks-MBP SWOT % cat test2.txt
Hello world
jldechow@Jacks-MBP SWOT % mkdir test_dir
jldechow@Jacks-MBP SWOT % mv *.txt test_dir
jldechow@Jacks-MBP SWOT % ls
Archive		LakeObs		test_dir	TuolumneMeadows	ZipFiles
jldechow@Jacks-MBP SWOT % ls test_dir
test.txt	test2.txt
```
Here, we used `cp test.txt test2.txt` to make a copy of `text.txt` called `test2.txt`. We use `ls` again to check they were both created. Then, we use `cat test2.txt` to double check the contents of `test2.txt` are the same as `test.txt`. Next, we use `mkdir test_dir` to create a directory named `test_dir`. After that, we use `mv *.txt test_dir` to move all files with `.txt` extensions into the folder `test_dir/`. We use `ls` again to check that the text files are no longer in `/Users/jldechow/Data/SWOT` and then use `ls test_dir` to print the contents of directory `test_dir`.

Finally, lets remove the test files

```bash
jldechow@Jacks-MBP SWOT % rm test_dir/test.txt
jldechow@Jacks-MBP SWOT % ls test_dir 
test2.txt
jldechow@Jacks-MBP SWOT % rm test_dir
rm: test_dir: is a directory
jldechow@Jacks-MBP SWOT % rm -r test_dir
jldechow@Jacks-MBP SWOT % ls
Archive		LakeObs		TuolumneMeadows	ZipFiles
```
First, we use `rm test_dir/test.txt` to remove the first test file, and we use `ls test_dir` to confirm it’s been deleted. Next, we use `rm test_dir` to try to remove the directory. As you can see in the command line output, it doesn’t work because `test_dir` is a directory! The next line, we do it again with the flag for a recursive operation: `-r`. Generally, this flag is required for any operations involving folders. Using `rm -r test_dir` we remove `test_dir/` and its contents, and then confirm it’s gone.

## 2. Accessing the cluster
### 2.1 Terminal
For MacOS users, the only requirement is to open the native `Terminal` app.

For Windows users, a terminal application needs to be downloaded. When I was working on windows machines, I used the `PuTTY` terminal emulator (https://putty.org/index.html). 

### 2.2 SSH
To actually connect to the cluster, we use the command `ssh` to use the `secure shell protocol`. If you’ve ever heard someone say “I need to remote into the cluster”, this is what they mean. To actually do this, open your `Terminal` application and type the following command:

`ssh onyen@river.emes.unc.edu`

In my case when I ssh to the GHL cluster I see the following:

```bash
jldechow@Jacks-MBP SWOT % ssh jldechow@river.emes.unc.edu
***************************************************************************

                The University of North Carolina at Chapel Hill
               ----------------------- o -----------------------
               Unauthorized access to this system is prohibited.

***************************************************************************
jldechow@river.emes.unc.edu's password: 
```
Here, enter your password and you are officially “remotely connected to the cluster”!

## 3. Using the cluster
### 3.1 Basic structure of the GHL cluster
While the examples in this section are specific to the UNC EMES River cluster, most of these ideas are generically applicable to most cluster systems. First, lets see *where* on the cluster we end up after a successful `ssh` execution.

```bash
Last login: Fri Nov  7 13:14:45 2025 from 152.23.121.91
##########################################################################
#                                                                        #
#  University of North Carolina at Chapel Hill                           #
#                College of Arts and Sciences Teaching and research      #
#                     Linux Environment (C.A.S.T.L.E.)                   #
#                                                                        #
# Report problems with this system and requests for assistance at        #
#  <http://help.unc.edu/>. Please mention OASIS-Linux-Support in         #
#  the incident report.                                                  #
#                                                                        #
##########################################################################
Host:     river.emes.unc.edu | 152.19.218.21 | 3e:de:7d:a9:48:79
OS:       Ubuntu 24.04 | 6.8.0-85-generic
Platform: Dell Inc. PowerEdge R7725
Memory:   515.2GB
CPU:      96 vcpu | 2 socket | 24 cores-per-socket | 2 threads-per-core

Last_Managed: 2025-11-07 12:05:04 EST


***************************************************************************
jldechow@river:~$ pwd
/afs/cas.unc.edu/users/j/l/jldechow
jldechow@river:~$ 
```

When I `ssh` into the `River` cluster, it prints out the resources available on the cluster. After using `pwd` we can see the I am in the directory `/afs/cas.unc.edu/users/j/l/jldechow` which is my *home* directory. On UNIX systems, your home directory is most often given the `alias` or `symbolic link` of `~`. Let’s print that out below on the CLI

```bash
jldechow@river:~$ readlink -f ~
/afs/cas.unc.edu/users/j/l/jldechow
```

Here we use command `readlink` to print the value of a `symlink` with the flag `-f` to ensure that if there are nested symlinks, they all print their full path.  

### 3.2 Understanding the available resources
Let's revisit the splash text printed by the River Cluster when we first `ssh` into the remote machine.

```bash
Last login: Fri Nov  7 13:14:45 2025 from 152.23.121.91
##########################################################################
#                                                                        #
#  University of North Carolina at Chapel Hill                           #
#                College of Arts and Sciences Teaching and research      #
#                     Linux Environment (C.A.S.T.L.E.)                   #
#                                                                        #
# Report problems with this system and requests for assistance at        #
#  <http://help.unc.edu/>. Please mention OASIS-Linux-Support in         #
#  the incident report.                                                  #
#                                                                        #
##########################################################################
Host:     river.emes.unc.edu | 152.19.218.21 | 3e:de:7d:a9:48:79
OS:       Ubuntu 24.04 | 6.8.0-85-generic
Platform: Dell Inc. PowerEdge R7725
Memory:   515.2GB
CPU:      96 vcpu | 2 socket | 24 cores-per-socket | 2 threads-per-core

Last_Managed: 2025-11-07 12:05:04 EST


***************************************************************************
jldechow@river:~$ 
```
#### Host
Let's go through and break this down line by line, starting with the `Host`. For example, CLI on River shows `jldechow@river:`. This shows that the user `jldechow` is logged onto the host machine `river`. For small clusters or local machines, this is not super important. However, on large HPC clusters, sometimes the `host` where your `user` and directories live at doesn't match up with the `host` that compute job are run on. On a MacOS machine, you can see this in the terminal as well. For example, on my laptop the terminal shows `jldechow@Jacks-MBP`. As far as the operating system is concerned, the name of my computer is `Jacks-MBP`. The hostname for a Windows machine can be seen in the "About this PC" section. 

#### OS
Next, the splash reports that the operating system or OS the server is running on is `Ubuntu 24.04 | 6.8.0-85-generic`. Ubuntu is a free and widely used distribution of `Linux`. Linux is another UNIX-like OS, and is used on virtually every single supercomputer. Ubuntu is a specific distribution, which can be though of as the "brand" of Linux you are using. Other popular distributions for HPC applications are `Redhat` and `Debian`.

#### Platform
This computer was manufactured by Dell, and the model name and number is `PowerEdge R7725`.

#### Memory
Memory or RAM (random access memory) is the amount of high speed storage used for cache-ing or holding data/programs/addresses for easy access. Computers typical have RAM in quantities that are powers of 2. Since the system reports `515.2GB` of RAM, the system likely has `512GB` of RAM available for computing, and the other `3.2GB` of RAM is reserved for system level processes (i.e. running the remote machine).

#### CPU
Finally, the CPU. The Central Processing Unit is the "brain" or "engine" of a computer. The splash gives us the following information:
`CPU:      96 vcpu | 2 socket | 24 cores-per-socket | 2 threads-per-core`
Lets break this down in a slightly different order than it's given to us:
`2 socket` - This machine has two physical CPUs. Most consumer computers have 1.

`24 cores-per-socket` A CPU is called a central processing `unit` for a reason. The unit itself has multiple `processors` that are each called a `core`. Since the splash tells us that the server has `24 cores-per-socket`, we know that we have `1 CPU` in each of our `2 sockets` and each of our `1 CPU` has `24 processor cores`. This gives us a total of `48 physical cores`. 
`96 vcpu` - Historically, a single CPU core could process a single set of instructions at a time. Through a method called `multithreading`, a single physical core can be split into 2,4, or 8 `virtual cores`. On some retail CPUs this is marketed as `hyperthreading`. Given that we have `2 CPU` @ `24 cores-per-socket` and `96 vcpu`, we can assume that the multithreading on this machine is `2x`.


Given all of this, in theory a single job on the River cluster could request `512GB` of RAM and `96 CPUs`. This would be very rude though!