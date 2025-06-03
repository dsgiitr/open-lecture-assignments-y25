# Missing Semester Lecture 1: The Shell

## Solutions

1) I already have Ubuntu installed on my system via dual boot. I can use the Ubuntu terminal on my Windows terminal which runs through WSL as well. I verified this by running the echo $SHELL command, which gave /bin/bash as output, confirming that I am working in the required shell.
```bash 
 ishika@LAPTOP-0EUE93V4:~$ echo $SHELL 
 /bin/bash
``` 

2) I used mkdir command to create a directory under /tmp named missing.

```bash
ishika@LAPTOP-0EUE93V4:~$ mkdir /tmp/missing
```
I confirmed it using ls command which gives the list of all the files/sub-directories present in a directory.
```bash
ishika@LAPTOP-0EUE93V4:~$ ls /tmp
missing
snap-private-tmp
systemd-private-e23e66b1b8c54d69a0ab9b9f7a0ad759-apt-news.service-y2QpVy
systemd-private-e23e66b1b8c54d69a0ab9b9f7a0ad759-esm-cache.service-wEACev
systemd-private-e23e66b1b8c54d69a0ab9b9f7a0ad759-systemd-logind.service-XjpEJ3
systemd-private-e23e66b1b8c54d69a0ab9b9f7a0ad759-systemd-resolved.service-lykdnH
systemd-private-e23e66b1b8c54d69a0ab9b9f7a0ad759-systemd-timesyncd.service-ykYq35
systemd-private-e23e66b1b8c54d69a0ab9b9f7a0ad759-wsl-pro.service-MBlJDc
```

3) Touch command allows us to create empty files or update the relevant timestamps of a file. Using touch, we can update the access time(i.e. last time the file was read) and moodification time(i.e. when the contents of the file were last changed) to the present time.


4) 
```bash
ishika@LAPTOP-0EUE93V4:~$ touch /tmp/missing/semester
```
I confirmed it later using ls command.
```bash
ishika@LAPTOP-0EUE93V4:~$ ls /tmp/missing
semester
```

5) The latest version of Ubuntu corresponds the shell /bin/sh to the shell program dash, referred to as symbolic link between the two. The dash subshell does not allow History Expansion, which changes the behavior of '!', and is used as a shortcut to run previous commands. Since this feature does not work in dash subshell, using either single or double quotes does not cause any issues. In case of bash, we can simply use single quotes in place of double quotes.
```bash
ishika@LAPTOP-0EUE93V4:~$ echo '#!/bin/sh' > /tmp/missing/semester
ishika@LAPTOP-0EUE93V4:~$ echo "curl --head --silent https://missing.csail.mit.edu" >> /tmp/missing/semester
ishika@LAPTOP-0EUE93V4:~$ cat /tmp/missing/semester
#!/bin/sh
curl --head --silent https://missing.csail.mit.edu
```

I confirmed that I am on dash subshell using ls command.
```bash
ishika@LAPTOP-0EUE93V4:~$ ls -l /bin/sh
lrwxrwxrwx 1 root root 4 Mar 31  2024 /bin/sh -> dash
```

6) Executing the script under missing file shows:
```bash
ishika@LAPTOP-0EUE93V4:~$ /tmp/missing/semester
-bash: /tmp/missing/semester: Permission denied
ishika@LAPTOP-0EUE93V4:~$ ls -l /tmp/missing
total 4
-rw-r--r-- 1 ishika ishika 61 Jun  1 08:26 semester
```
As we can see, there is a - in place of x in the first column which gives us information about the permissions placed on a file or directory. The - in place of x indicates that we are not allowed to execute the script stored in semester.


7) Forcefully running sh interpreter to execute the script stored in semester gives:
```bash
ishika@LAPTOP-0EUE93V4:~$ sh /tmp/missing/semester
HTTP/2 200
server: GitHub.com
content-type: text/html; charset=utf-8
last-modified: Sat, 19 Apr 2025 16:35:21 GMT
access-control-allow-origin: *
etag: "6803d0c9-205d"
expires: Sun, 01 Jun 2025 12:06:12 GMT
cache-control: max-age=600
x-proxy-cache: MISS
x-github-request-id: 527D:17B599:49773E:4D4B7C:683C3FDC
accept-ranges: bytes
age: 0
date: Sun, 01 Jun 2025 12:28:43 GMT
via: 1.1 varnish
x-served-by: cache-bom4739-BOM
x-cache: HIT
x-cache-hits: 0
x-timer: S1748780923.727788,VS0,VE299
vary: Accept-Encoding
x-fastly-request-id: 447ce580bec995a3cfeb640c8fe48afc22ac15a0
content-length: 8285
```

Running the file semester semester under sh worked but simply executing it by writing the path didn't because a newly created file is non-executable by default, which we checked earlier by taking a look at the permissions using ls command. sh on the other hand is a command interpreter. It directly executes whatever argument is passed into it. Here is an excerpt from the manual of sh command:

>It incorporates many features to aid interactive use  and  has  the
>advantage  that  the  interpretative  language  is  common  to both interactive and non-interactive use (shell
>scripts).  That is, commands can be typed directly to the running shell or can be put into a file and the file
>can be executed directly by the shell.

So, it does not matter if a file is executable or not. The sh command will execute it because that is what it is supposed to do.


8) chmod is used to make changes to the permissions of a file or directory.


9) We can use chmod to make a file executable.
```bash
ishika@LAPTOP-0EUE93V4:~$ chmod +x /tmp/missing/semester
ishika@LAPTOP-0EUE93V4:~$ /tmp/missing/semester
HTTP/2 200
server: GitHub.com
content-type: text/html; charset=utf-8
last-modified: Sat, 19 Apr 2025 16:35:21 GMT
access-control-allow-origin: *
etag: "6803d0c9-205d"
expires: Sun, 01 Jun 2025 12:06:12 GMT
cache-control: max-age=600
x-proxy-cache: MISS
x-github-request-id: 527D:17B599:49773E:4D4B7C:683C3FDC
accept-ranges: bytes
age: 0
date: Sun, 01 Jun 2025 13:07:50 GMT
via: 1.1 varnish
x-served-by: cache-bom4738-BOM
x-cache: HIT
x-cache-hits: 0
x-timer: S1748783270.092229,VS0,VE196
vary: Accept-Encoding
x-fastly-request-id: da5e66bf18c4cc88696139218aaa00c92fd799ac
content-length: 8285
```

The change is permissions can be verified.
```bash
ishika@LAPTOP-0EUE93V4:~$ ls -l /tmp/missing/semester
-rwxr-xr-x 1 ishika ishika 61 Jun  1 08:26 /tmp/missing/semester
```
The x's in the first columns shows that the file is now executable for the owner, groups and any user as well.

To make sure our script is executed under sh interpreter, we wrote the shebang line into the file(#!bin/sh). The shebang is used to define the interpreter the script is supposed to run into. Whenever we are supposed to execute a file using shebang, we are telling the system to execute the script under the interpreter defined in the shebang only.


10) 
```bash
ishika@LAPTOP-0EUE93V4:~$ curl --head --silent https://missing.csail.mit.edu | grep -i last-modified > last-modified.txt
ishika@LAPTOP-0EUE93V4:~$ cat last-modified.txt
last-modified: Sat, 19 Apr 2025 16:35:21 GMT
```
This text file is by default created in the current directory, which happens to be my home directory and can be verified using pwd command.
```bash
ishika@LAPTOP-0EUE93V4:~$ pwd
/home/ishika
```


11) The battery parameter is stored in the power_supply directory under the parent directory class in sys.
```bash 
ishika@LAPTOP-0EUE93V4:~$ cat /sys/class/power_supply/BAT1/capacity
56
```










