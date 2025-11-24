# UNC Cluster Computing Workshop - Git Setup Tutorial
## 0. Introduction
This is a basic tutorial to set up Git on the remote cluster and clone an existing repo from Github. I will do this for my own account and clone the `ClusterComputingWorkshop` repo this tutorial exists in.

## 1. Prep Work

First, we check if Git is installed. On `River` we know it is, but do this anyway.

```bash
jldechow@river:~$ git --version
git version 2.43.0
```

Next, we generate an `ssh-keygen` to link to our GitHub account using `ssh-keygen -t ed25519 -C "onyen@unc.edu.com"`. This requires your UNC email to be linked to your GitHub.

```bash
jldechow@river:~$ ssh-keygen -t ed25519 -C "jldechow@unc.edu.com"
Generating public/private ed25519 key pair.
```

This will prompt you to choose a file to save your keygen in. If you just hit enter and accept the default path it will save to `~/.ssh`. Files that start with `.` are hidden by default. It will then ask you if you want to designate a passphrase to use with Git. I recommend picking something you won't forget, this is essentially a second passphrase. The output should look like this:

`Your public key has been saved in /afs/cas.unc.edu/users/a/a/onyen/.ssh/id_ed25519.pub`

Next, we get the public key with `cat ~/.ssh/id_ed25519.pub`. We then go to GitHub → Settings → SSH and GPG keys → New SSH key → paste it. After this is done, test your connection with `ssh -T git@github.com`. The shell will ask if you want to continue connecting and trust the connection. Say yes and you should be connected.

## 2. Cloning Repo

To clone your repo, run `git clone git@github.com:your-username/your-repo.git`. In my case I am cloning `https://github.com/dechowjack/ClusterComputingWorkshop`.


```bash
jldechow@river:~$ git clone git@github.com:dechowjack/ClusterComputingWorkshop.git
Cloning into 'ClusterComputingWorkshop'...
Enter passphrase for key '/afs/cas.unc.edu/users/j/l/jldechow/.ssh/id_ed25519': 
remote: Enumerating objects: 78, done.
remote: Counting objects: 100% (78/78), done.
remote: Compressing objects: 100% (62/62), done.
remote: Total 78 (delta 39), reused 49 (delta 14), pack-reused 0 (from 0)
Receiving objects: 100% (78/78), 32.83 KiB | 2.34 MiB/s, done.
Resolving deltas: 100% (39/39), done.
jldechow@river:~$ ls
ClusterComputingWorkshop  OUT  private	public	public_html  scratch  workdir  yesterday
jldechow@river:~$
```
Now, I've cloned the repo to the remote server!

## 3. Setting Identity
If you plan to be pushing from the cluster, make sure to set your identity using:

```bash
git config --global user.name "Jack Dechow"
git config --global user.email "your_email@example.com"
```

## 4. Push/Pull/Etc
When you want to pull the latest version of a branch,run:

`git pull origin branchname`

To check the status of any changes on the branch, run:

`git status`

To commit changes:

`git commit -m "Describe what you changed"`

To push to a branch

`git push origin branchname`
