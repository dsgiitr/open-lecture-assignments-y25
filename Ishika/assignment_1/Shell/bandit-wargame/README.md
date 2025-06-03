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

13) I gave the temporary directory a hard to guess name by using base64 encoding. Then I moved into that directory and copied the data.txt file there. This helped in keeping the home directory clean as there was a lot of decompressing and we could experiment however we wanted.I
I also had to rename the files everytime I wanted to decompress to fit the extension of the type of compression because the commands were not seeing them as valid files without proper extensions. 
```bash 
bandit12@bandit:~$ mktemp -d "/tmp/$(echo -n 'hard_to_guess' | base64).XXXXXX"
/tmp/aGFyZF90b19ndWVzcw==.LUb4ip
bandit12@bandit:/$ tmpdir="/tmp/aGFyZF90b19ndWVzcw==.LUb4ip"
bandit12@bandit:~$ cp data.txt $tmpdir
bandit12@bandit:/$ cd $tmpdir
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ mv data.txt hexdump.txt
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ xxd -r hexdump.txt > decoded
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ file decoded
decoded: gzip compressed data, was "data2.bin", last modified: Thu Apr 10 14:22:57 2025, max compression, from Unix, original size modulo 2^32 585
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ mv decoded decoded.gz
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ gzip -d decoded.gz
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ ls -la
total 9988
drwx------    2 bandit12 bandit12     4096 Jun  3 07:26 .
drwxrwx-wt 2118 root     root     10211328 Jun  3 07:26 ..
-rw-rw-r--    1 bandit12 bandit12      585 Jun  3 07:24 decoded
-rw-r-----    1 bandit12 bandit12     2646 Jun  3 06:59 hexdump.txt
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ file decoded
decoded: bzip2 compressed data, block size = 900k
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ mv decoded decoded.bz2
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ bzip2 -d decoded.bz
bzip2: Can't open input file decoded.bz: No such file or directory.
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ bzip2 -d decoded.bz2
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ ls -l
total 8
-rw-rw-r-- 1 bandit12 bandit12  443 Jun  3 07:24 decoded
-rw-r----- 1 bandit12 bandit12 2646 Jun  3 06:59 hexdump.txt
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ file decoded
decoded: gzip compressed data, was "data4.bin", last modified: Thu Apr 10 14:22:57 2025, max compression, from Unix, original size modulo 2^32 20480
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ mv decoded decoded.gz
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ gzip -d decoded.gz
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ file decoded
decoded: POSIX tar archive (GNU)
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ mv decoded decoded.tar
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ tar -xf decoded.tar
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ file decoded
decoded: cannot open `decoded' (No such file or directory)
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ ls -l
total 36
-rw-r--r-- 1 bandit12 bandit12 10240 Apr 10 14:22 data5.bin
-rw-rw-r-- 1 bandit12 bandit12 20480 Jun  3 07:24 decoded.tar
-rw-r----- 1 bandit12 bandit12  2646 Jun  3 06:59 hexdump.txt
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ file data5.bin
data5.bin: POSIX tar archive (GNU)
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ tar -xf data5.bin
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ ls -l
total 40
-rw-r--r-- 1 bandit12 bandit12 10240 Apr 10 14:22 data5.bin
-rw-r--r-- 1 bandit12 bandit12   222 Apr 10 14:22 data6.bin
-rw-rw-r-- 1 bandit12 bandit12 20480 Jun  3 07:24 decoded.tar
-rw-r----- 1 bandit12 bandit12  2646 Jun  3 06:59 hexdump.txt
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ file data6.bin
data6.bin: bzip2 compressed data, block size = 900k
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ mv data6.bin data6.bz2
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ bzip2 -d data6.bz2
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ ls
data5.bin  data6  data8.bin  decoded.tar  hexdump.txt
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ file data6
data6: POSIX tar archive (GNU)
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ mv data8.bin data8.gz
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ gzip -d data8.gz
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ ls
data5.bin  data6  data8  decoded.tar  hexdump.txt
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ file data8
data8: ASCII text
bandit12@bandit:/tmp/aGFyZF90b19ndWVzcw==.LUb4ip$ cat data8
```

14) -i flag stands for identity file which allows us to tell ssh which key to use for authentication.   
```bash
bandit13@bandit:~$ ls
sshkey.private
bandit13@bandit:~$ ssh -i sshkey.private -p 2220  bandit14@localhost
bandit14@bandit:~$ cat /etc/bandit_pass/bandit14
```

15) nc connects us to a service on port 30000, allowing us to send and recieve passwords.
```bash
bandit14@bandit:~$ nc localhost 30000
```


