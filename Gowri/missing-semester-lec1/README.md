```bash
gowridv@LAPTOP-48R9ENFL:~$ echo $SHELL
/bin/bash
gowridv@LAPTOP-48R9ENFL:~$ mkdir /tmp/missing
gowridv@LAPTOP-48R9ENFL:~$ man touch
gowridv@LAPTOP-48R9ENFL:~$ touch /tmp/missing/semester
gowridv@LAPTOP-48R9ENFL:~$ echo '#!/bin/sh' > /tmp/missing/semester
gowridv@LAPTOP-48R9ENFL:~$ echo 'curl --head --silent https://missing.csail.mit.edu' >> /tmp/missing/semester
gowridv@LAPTOP-48R9ENFL:~$ cat /tmp/missing/semester
#!/bin/sh
curl --head --silent https://missing.csail.mit.edu
gowridv@LAPTOP-48R9ENFL:~$ cd /tmp/missing
gowridv@LAPTOP-48R9ENFL:/tmp/missing$ ./semester
-bash: ./semester: Permission denied
gowridv@LAPTOP-48R9ENFL:/tmp/missing$ ls -alps
total 12
4 drwxr-xr-x  2 gowridv gowridv 4096 Jun  3 23:17 ./
4 drwxrwxrwt 10 root    root    4096 Jun  3 23:15 ../
4 -rw-r--r--  1 gowridv gowridv   61 Jun  3 23:18 semester

gowridv@LAPTOP-48R9ENFL:/tmp/missing$ sh ./semester
HTTP/2 200
server: GitHub.com
content-type: text/html; charset=utf-8
last-modified: Sat, 19 Apr 2025 16:35:21 GMT
access-control-allow-origin: *
etag: "6803d0c9-205d"
expires: Tue, 03 Jun 2025 04:25:22 GMT
cache-control: max-age=600
x-proxy-cache: MISS
x-github-request-id: A4B1:39F17E:C9837:F54D2:683E76DA
accept-ranges: bytes
age: 0
date: Tue, 03 Jun 2025 17:54:13 GMT
via: 1.1 varnish
x-served-by: cache-maa10225-MAA
x-cache: HIT
x-cache-hits: 0
x-timer: S1748973254.703735,VS0,VE226
vary: Accept-Encoding
x-fastly-request-id: 481a0e6a5c0525c84004b529bbef0c017c36459f
content-length: 8285
gowridv@LAPTOP-48R9ENFL:/tmp/missing$ man chmod
gowridv@LAPTOP-48R9ENFL:/tmp/missing$ chmod +x semester
gowridv@LAPTOP-48R9ENFL:/tmp/missing$ ls -alps
total 12
4 drwxr-xr-x  2 gowridv gowridv 4096 Jun  3 23:17 ./
4 drwxrwxrwt 10 root    root    4096 Jun  3 23:15 ../
4 -rwxr-xr-x  1 gowridv gowridv   61 Jun  3 23:18 semester
gowridv@LAPTOP-48R9ENFL:/tmp/missing$ ./semester | grep "last-modified" > ~/last-modified.txt
gowridv@LAPTOP-48R9ENFL:/tmp/missing$ cat ~/last-modified.txt
last-modified: Sat, 19 Apr 2025 16:35:21 GMT
gowridv@LAPTOP-48R9ENFL:/tmp/missing$ cat /sys/class/power_supply/BAT*/capacity
84
```
