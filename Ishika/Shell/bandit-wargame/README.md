# Bandit : OverTheWire 

## Solutions Lvl 0 - 15

Note: I had already done all these levels earlier so this time around, I tried to implement some of the commands and tricks which were taught in the missing semester lecture and assignments.

0) We are using ssh command which allows us to securely access remote computers over a network. Here we are using it to log into another computer using the info provided.
```bash
$ ssh -p 2220 bandit0@bandit.labs.overthewire.org
```

1) cat reads the contents of a file. ~ denotes home directory. 
```bash
$ cat ~/readme
```

2) 
```bash
$ cat ~/-
```

3) For filenames with spaces, we can simply put them under quotation marks, so the shell does not consider each word from the file name as a separate argument.
```bash
$ cat "spaces in this filename"
```

4) For hidden files, -l flag can be used along with the ls command to list them along with the other files.
```bash
$ ls
inhere
$ ls -a inhere
.  ..  ...Hiding-From-You
$ cat inhere/...Hiding-From-You
```

5) The file command with ./* gives the type for all the files stored in the current directory.
-file07 is the only one in human-readable format.
```bash
bandit4@bandit:~$ ls
inhere
bandit4@bandit:~$ cd inhere
bandit4@bandit:~/inhere$ ls
-file00  -file02  -file04  -file06  -file08
-file01  -file03  -file05  -file07  -file09
bandit4@bandit:~/inhere$ file ./*
./-file00: PGP Secret Sub-key -
./-file01: data
./-file02: data
./-file03: data
./-file04: data
./-file05: data
./-file06: data
./-file07: ASCII text
./-file08: data
./-file09: data
bandit4@bandit:~/inhere$ cat ./-file07
```
6) Here we are using find to get all the files satiifying the file type and size conditions and redirecting this into xargs using piping, which will use all the files we find and use the ls command in the long list format to check if the file is executable or not.
```bash
bandit5@bandit:~$ find . -type f -size 1033c | xargs ls -l
-rw-r----- 1 root bandit5 1033 Apr 10 14:23 ./inhere/maybehere07/.file2
bandit5@bandit:~$ cat ./inhere/maybehere07/.file2
```

7) Since the file is somewhere on the server, we have to search the entire filesystem. In this process, we will find lots of files we are not permitted to open but will unnecessarily flood our terminal. To prevent this we redirected the STDERR stream to null. 
```bash
bandit6@bandit:~$ find / -user bandit7 -group bandit6 -size 33c 2>/dev/null
/var/lib/dpkg/info/bandit7.password
bandit6@bandit:~$ cat /var/lib/dpkg/info/bandit7.password
```

8) grep looks of all the lines containing the word "millionth" in the file data.txt and shows them on our terminal. 
```bash
bandit7@bandit:~$ ls
data.txt
bandit7@bandit:~$ grep "millionth" data.txt
```

9) 'sort' command as the name suggests sorts the lines of a text either alphabetically or numerically. 'uniq' removes duplicate adjacent lines and is generally used along with 'sort'. The -c flag counts the number of times a line occurs.   
```bash
bandit8@bandit:~$ sort data.txt | uniq -c
```

10) 'strings' command only shows human-readable lines from a text file.     
```bash 
bandit9@bandit:~$ strings data.txt ; grep "="
```

11) -d flag decodes the data in base64 present in the file. 
```bash
bandit10@bandit:~$ base64 -d data.txt
```

12) Here, we are taking the text from file data.txt and piping it into the 'tr' command, which translates the characters from a rot13 script to a normal script. 
```bash
bandit11@bandit:~$ cat data.txt | tr '[a-zA-Z]' '[n-za-mN-ZA-M]'
```