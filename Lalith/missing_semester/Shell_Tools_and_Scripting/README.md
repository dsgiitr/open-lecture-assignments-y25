# Shell Tools and Scripts
```bash
 missing ls -la -h -t -r
total 32K
-rwxrwxr-x  1 delete delete   61 Jun  3 20:50 semester
drwxrwxr-x  2 delete delete 4.0K Jun  3 20:54 .
-rw-rw-r--  1 delete delete   32 Jun  3 20:54 last_modified.txt
drwxrwxrwt 71 root   root    20K Jun  3 21:01 ..
```
`-l` - long listing format<br>
`-a` - include hidden files<br>
`-h` - human-readable sizes<br>
`-t` - sort by modification time, newest first<br>
`-r` - reverse order while sorting<br>
# This script defines two functions: marco and polo.
```bash
#!/bin/sh
marco(){
    export MARCO="$PWD"
    # This function sets the MARCO variable to the current working directory.
}
polo(){
    if [ -z "$MARCO" ]; then
        echo "MARCO is not set. Please run 'marco' first."
        # -z checks if the variable is empty.
    else
        cd "$MARCO" || echo "Failed to change directory to $MARCO"

    fi
}
``` 
## Usage
```console
➜  Downloads marco 
➜  Downloads cd ..
➜  ~ polo
➜  Downloads 
```

