# Lecture -2 : Shell Tools and Scripting

## Solutions

1) To fulfill the given requirements, I used the following flags and options:

- -l : to list the files and directories with the fields gievn in the sample output- permissions, link count, owner, group, size, timestamp, name from left to right respectively.
- -a : to show hidden files in the list as well
- -h : shows the sizes in human-readable formats(such as M, K etc.)
- -t : sorts the files on the basis of when they were created, beginning from the recent ones
- --color=auto : shows the output in colorized format, but only when the output stream, i.e. STOUT is directed towards the terminal.
  
```bash
ishika@LAPTOP-0EUE93V4:~$ ls -laht --color=auto
total 56K
drwxr-x--- 8 ishika ishika 4.0K Jun  1 19:36 .
drwxr-xr-x 2 ishika ishika 4.0K Jun  1 19:36 three
drwxr-xr-x 2 ishika ishika 4.0K Jun  1 19:36 two
drwxr-xr-x 2 ishika ishika 4.0K Jun  1 19:36 one
-rw------- 1 ishika ishika 1.8K Jun  1 14:25 .bash_history
drwx------ 2 ishika ishika 4.0K Jun  1 14:12 .ssh
-rw-r--r-- 1 ishika ishika   46 Jun  1 13:26 last-modified.txt
-rw------- 1 ishika ishika   20 Jun  1 13:06 .lesshst
-rw-r--r-- 1 ishika ishika    0 May 31 14:50 .hushlogin
-rw-r--r-- 1 ishika ishika    0 May 31 14:49 .motd_shown
drwx------ 2 ishika ishika 4.0K May 31 14:49 .cache
drwxr-xr-x 2 ishika ishika 4.0K May 31 14:49 .landscape
-rw-r--r-- 1 ishika ishika  220 May 31 14:48 .bash_logout
-rw-r--r-- 1 ishika ishika 3.7K May 31 14:48 .bashrc
-rw-r--r-- 1 ishika ishika  807 May 31 14:48 .profile
drwxr-xr-x 3 root   root   4.0K May 31 14:48 ..
```

2) Bash script written in marco.sh:
 ```bash
 #!/bin/sh

 marco(){
     touch /tmp/save_directory
     pwd > /tmp/save_directory 
 }

 polo(){
     cd "$(cat /tmp/save_directory)"
 }
 ```

Example of execution:
```bash
ishika@LAPTOP-0EUE93V4:~$ mkdir one two three
ishika@LAPTOP-0EUE93V4:~$ mkdir one/here
ishika@LAPTOP-0EUE93V4:~$ source '/mnt/c/Users/Lenovo/OneDrive/Desktop/dsg assignment 1/marco.sh'
ishika@LAPTOP-0EUE93V4:~$ chmod +x '/mnt/c/Users/Lenovo/OneDrive/Desktop/dsg assignment 1/marco.sh'
ishika@LAPTOP-0EUE93V4:~$ cd one/here
ishika@LAPTOP-0EUE93V4:~/one/here$ marco
ishika@LAPTOP-0EUE93V4:~/one/here$ cd ~
ishika@LAPTOP-0EUE93V4:~$ cd three
ishika@LAPTOP-0EUE93V4:~/three$ polo
ishika@LAPTOP-0EUE93V4:~/one/here$
```

Here I created a file save_directory in the /tmp directory. I gave it an absolute path so the file can be accessed outside the function definition as well. This file saves the path of the directory we are currently in which is later used to cd back into this directory upon calling polo.

3) The script to check the given script can be written as:
 ```bash
 #!/usr/bin/env bash

 count=0

 while true; do
    ./script_q3.sh >> stdout_file 2>> stderr_file
     if [[ $? -ne 0 ]]; then
         break
     fi    
     ((count++))
 done 

 echo "The standard output is:"
 cat stdout_file

 echo "The standard error is:"
 cat stderr_file

 echo "The error count is $count"
 ```

4) 
```bash
$find . -type f -name "*.html" | xargs -d '\n' zip file.zip
```

This command looks for all the files with html extension, pipes it into xargs command which zips all these files into file.zip. The -d flag with xargs is used to handle filenames with specifications, in this case spaces.

5) To look for the most recent file in a directory, this can be done simply as:
```bash
$ ls -lt | head -n 2 | tail -n 1
```
As for looking up the entire filesystem to find the most recent modified file, I tried something along the logic of:
```bash
$find / -type f 2>/dev/null | xargs stat -c '%Y %n' | sort -n | tail -n 1
```
which seems logically intact but does not work as we want it to. I could not figure it out before the deadline.











