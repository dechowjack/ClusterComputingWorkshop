# Linux + Slurm Flags Reference Sheet
## Common Linux Commands Flags
| **Command** | **Flag(s)** | **Example**                       | **Explanation**                                                                     |
| ----------- | ----------- | --------------------------------- | ----------------------------------------------------------------------------------- |
| `ls`        | `-a`        | `ls -a`                           | Show *all* files, including hidden ones (those starting with a `.`).                |
|             | `-l`        | `ls -l`                           | Use the *long listing format* — shows file sizes, permissions, owners, and dates.   |
|             | `-h`        | `ls -lh`                          | Makes file sizes human-readable (e.g., `2K`, `1.3M` instead of raw bytes).          |
|             | `-t`        | `ls -lt`                          | Sorts files by modification time, newest first.                                     |
| `cp`        | `-r`        | `cp -r folder1/ folder2/`         | Recursively copy a folder and its contents.                                         |
|             | `-v`        | `cp -v file1 file2`               | “Verbose” mode — prints what’s being copied.                                        |
| `mv`        | `-v`        | `mv -v oldname newname`           | Verbose output, showing each move or rename.                                        |
| `rm`        | `-r`        | `rm -r folder/`                   | Removes folders *recursively* (everything inside).                                  |
|             | `-f`        | `rm -rf folder/`                  | “Force” deletion — skips confirmation prompts. ⚠️ Use with caution.                 |
|             | `-v`        | `rm -v file.txt`                  | Verbose — lists each file as it’s deleted.                                          |
| `mkdir`     | `-p`        | `mkdir -p /path/to/new/folder`    | Creates *all necessary parent directories* in the path.                             |
| `cat`       | `-n`        | `cat -n file.txt`                 | Adds line numbers to the file output.                                               |
| `head`      | `-n`        | `head -n 10 file.txt`             | Shows the first *n* lines (default is 10).                                          |
| `tail`      | `-n`        | `tail -n 20 file.txt`             | Shows the last *n* lines (default is 10).                                           |
|             | `-f`        | `tail -f logfile.txt`             | Continuously displays new lines as they’re added — useful for watching logs.        |
| `grep`      | `-i`        | `grep -i "snow" data.txt`         | Case-insensitive search for a word or phrase.                                       |
|             | `-r`        | `grep -r "error" ./logs/`         | Search recursively through all files in a directory.                                |
|             | `-n`        | `grep -n "word" file.txt`         | Show line numbers for each match.                                                   |
| `tar`       | `-xvzf`     | `tar -xvzf archive.tar.gz`        | Extract a compressed `.tar.gz` file (`x`=extract, `v`=verbose, `z`=gzip, `f`=file). |
|             | `-cvzf`     | `tar -cvzf backup.tar.gz folder/` | Create a compressed archive.                                                        |
| `chmod`     | `-R`        | `chmod -R 755 myfolder/`          | Apply permissions *recursively* to all files in a directory.                        |

## Common Slurm Command Flags
| **Command** | **Flag(s)** | **Example**                       | **Explanation**                                                                     |
| ----------- | ----------- | --------------------------------- | ----------------------------------------------------------------------------------- |
| `ls`        | `-a`        | `ls -a`                           | Show *all* files, including hidden ones (those starting with a `.`).                |
|             | `-l`        | `ls -l`                           | Use the *long listing format* — shows file sizes, permissions, owners, and dates.   |
|             | `-h`        | `ls -lh`                          | Makes file sizes human-readable (e.g., `2K`, `1.3M` instead of raw bytes).          |
|             | `-t`        | `ls -lt`                          | Sorts files by modification time, newest first.                                     |
| `cp`        | `-r`        | `cp -r folder1/ folder2/`         | Recursively copy a folder and its contents.                                         |
|             | `-v`        | `cp -v file1 file2`               | “Verbose” mode — prints what’s being copied.                                        |
| `mv`        | `-v`        | `mv -v oldname newname`           | Verbose output, showing each move or rename.                                        |
| `rm`        | `-r`        | `rm -r folder/`                   | Removes folders *recursively* (everything inside).                                  |
|             | `-f`        | `rm -rf folder/`                  | “Force” deletion — skips confirmation prompts. ⚠️ Use with caution.                 |
|             | `-v`        | `rm -v file.txt`                  | Verbose — lists each file as it’s deleted.                                          |
| `mkdir`     | `-p`        | `mkdir -p /path/to/new/folder`    | Creates *all necessary parent directories* in the path.                             |
| `cat`       | `-n`        | `cat -n file.txt`                 | Adds line numbers to the file output.                                               |
| `head`      | `-n`        | `head -n 10 file.txt`             | Shows the first *n* lines (default is 10).                                          |
| `tail`      | `-n`        | `tail -n 20 file.txt`             | Shows the last *n* lines (default is 10).                                           |
|             | `-f`        | `tail -f logfile.txt`             | Continuously displays new lines as they’re added — useful for watching logs.        |
| `grep`      | `-i`        | `grep -i "snow" data.txt`         | Case-insensitive search for a word or phrase.                                       |
|             | `-r`        | `grep -r "error" ./logs/`         | Search recursively through all files in a directory.                                |
|             | `-n`        | `grep -n "word" file.txt`         | Show line numbers for each match.                                                   |
| `tar`       | `-xvzf`     | `tar -xvzf archive.tar.gz`        | Extract a compressed `.tar.gz` file (`x`=extract, `v`=verbose, `z`=gzip, `f`=file). |
|             | `-cvzf`     | `tar -cvzf backup.tar.gz folder/` | Create a compressed archive.                                                        |
| `chmod`     | `-R`        | `chmod -R 755 myfolder/`          | Apply permissions *recursively* to all files in a directory.                        |
