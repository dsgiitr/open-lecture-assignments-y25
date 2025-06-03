1)

```bash
gowridv@LAPTOP-48R9ENFL:~$ ls -alh --color -t
total 88K
-rw-------  1 gowridv gowridv  10K Jun  3 21:16 .bash_history
drwxr-xr-x  5 gowridv gowridv 4.0K Jun  3 16:30 assign1
drwxr-xr-x  9 gowridv gowridv 4.0K Jun  3 15:37 typo_find
-rw-r--r--  1 gowridv gowridv  186 Jun  3 15:36 .gitconfig
-rw-r--r--  1 gowridv gowridv   16 Jun  3 15:36 .gitignore_global
drwxr-xr-x  3 gowridv gowridv 4.0K Jun  3 15:16 aliledit
drwxr-xr-x  9 gowridv gowridv 4.0K Jun  3 15:04 sem_web
drwxr-xr-x  9 gowridv gowridv 4.0K Jun  3 11:22 missing-semester
-rwxr-xr-x  1 gowridv gowridv   46 Jun  1 20:34 last-modified.txt
drwxr-xr-x  2 gowridv gowridv 4.0K Jun  1 19:50 missing
drwxr-xr-x  2 gowridv gowridv 4.0K Jun  1 18:57 .landscape
-rw-r--r--  1 gowridv gowridv  220 Jun  1 18:57 .bash_logout
-rw-r--r--  1 gowridv gowridv 3.7K Jun  1 18:57 .bashrc
-rw-r--r--  1 gowridv gowridv  807 Jun  1 18:57 .profile
drwxr-xr-x  3 root    root    4.0K Jun  1 18:57 ..
```

2)

```
marco.sh
#!/usr/bin/env bash

marco(){
export MARCO=$(pwd) 
}

polo(){ 
cd "$MARCO" 
}
```
3)
```
#!/usr/bin/env bash

count=0

while true; do

    ./tocheck.sh &> output.txt

    if [[ "$?" -ne 0 ]]; then
        break;
    fin

    count=$((count+1))

done

echo "Output:"
cat output.txt

echo "Number of runs before error was found: $count"
```

4)

```bash
gowridv@LAPTOP-48R9ENFL:~$ find . -type f -name "*.html" -print0 | xargs -0 -d '\n' zip htmltargeted.zip
xargs: zip: No such file or directory
```

5)

```bash
gowridv@LAPTOP-48R9ENFL:~$ find . -type f | ls -lt
total 32
drwxr-xr-x 5 gowridv gowridv 4096 Jun  3 16:30 assign1
drwxr-xr-x 9 gowridv gowridv 4096 Jun  3 15:37 typo_find
drwxr-xr-x 3 gowridv gowridv 4096 Jun  3 15:16 aliledit
drwxr-xr-x 9 gowridv gowridv 4096 Jun  3 15:04 sem_web
drwxr-xr-x 9 gowridv gowridv 4096 Jun  3 11:22 missing-semester
-rwxr-xr-x 1 gowridv gowridv   46 Jun  1 20:34 last-modified.txt
drwxr-xr-x 2 gowridv gowridv 4096 Jun  1 19:50 missing
```
