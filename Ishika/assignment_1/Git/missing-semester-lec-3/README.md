# Lec 6 : Version Control Systems(git)

## Solutions


2) The repo can be cloned as:
```bash
$ git clone https://github.com/missing-semester/missing-semester.git
```

a) Gives the version history of the given repo in graphical form.
```bash
$ git clone https://github.com/missing-semester/missing-semester.git
$ cd missing-semester
/missing-semester$ git log --all --graph --decorate
```

b) -1 only shows the last commit and -- README.md limits the log to only commits that modified README.md
```bash
~/missing-semester$ git log -1 -- README.md
```

c) blame looks for the modifier of only that line which contains the string "collections:". This gives us with the hash of that particular commit which we can use as an argument to the show command. It gives info about that commit, inculding the message it was commited with. 
```bash
~/missing-semester$ git blame _config.yml | grep "collections:"
~/missing-semester$ git show a88b4eac
```

3)  
```bash
ishika@LAPTOP-0EUE93V4:~$ git init demo
ishika@LAPTOP-0EUE93V4:~$ cd demo
ishika@LAPTOP-0EUE93V4:~/demo$ touch secret_file
ishika@LAPTOP-0EUE93V4:~/demo$ git add secret_file
ishika@LAPTOP-0EUE93V4:~/demo$ git commit -m "added the secret file, uh oh!"
[master (root-commit) ee60ad4] added the secret file, uh oh
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 secret
_file
ishika@LAPTOP-0EUE93V4:~/demo$ git rm secret_file
rm 'secret_file'
ishika@LAPTOP-0EUE93V4:~/demo$ git commit -m "deleted the secret file, sigh..."
[master e18c37f] deleted the secret file, sigh
 1 file changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 secret
_file
ishika@LAPTOP-0EUE93V4:~/demo$ git log
commit e18c37f3222d12c92b78438f755137625b9b7123 (HEAD -> master)
Author: ishika <ishikachikate5@gmail.com>
Date:   Tue Jun 3 17:15:01 2025 +0000

    deleted the secret file, sigh

commit ee60ad485f2e65227e1eb3e4d39ea545b617f582
Author: ishika <ishikachikate5@gmail.com>
Date:   Tue Jun 3 17:14:06 2025 +0000

    added the secret file, uh oh
```    
As we can see, the commit still shows up when we uploaded that file. That means anyone with the git repo can access the contents of those files by reverting back to the state when the commit was made using checkout.

To resolve this and remove our sensitive files, we use git-filter-repo.


