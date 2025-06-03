#   Missing Semester - The shell
```bash
➜  DSG echo $SHELL           

/usr/bin/zsh
➜  DSG cd /tmp       
➜  /tmp mkdir missing  
➜  missing touch semester 
➜  missing ls                    
semester
➜  missing vim semester    
➜  missing cat semester    
#!/bin/sh
curl --head --silent https://missing.csail.mit.edu
➜  missing ./semester 
zsh: permission denied: ./semester
missing sh semester                
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
date: Tue, 03 Jun 2025 15:22:58 GMT
via: 1.1 varnish
x-served-by: cache-maa10230-MAA
x-cache: HIT
x-cache-hits: 0
x-timer: S1748964179.556839,VS0,VE232
vary: Accept-Encoding
x-fastly-request-id: ad1e5ee275bec43d41de59c62121120265cea725
content-length: 8285
➜  missing chmod +x semester                            
➜  missing ./semester 
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
date: Tue, 03 Jun 2025 15:23:27 GMT
via: 1.1 varnish
age: 29
x-served-by: cache-maa10235-MAA
x-cache: HIT
x-cache-hits: 1
x-timer: S1748964207.403865,VS0,VE1
vary: Accept-Encoding
x-fastly-request-id: 351857597ed0a04d993ea9cb7f8310c767f9ab36
content-length: 8285
missing date -r semester > last_modified.txt
➜  missing cat last_modified.txt 
Tue Jun  3 08:50:46 PM IST 2025
missing cat /sys/class/power_supply/BAT0/capacity
65
missing cat /sys/class/thermal/thermal_zone0/temp 
43000
```