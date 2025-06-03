## Missing Semester Lecture 6: Version Control (Git)

1) Done.
   
2) Cloning the repository for class website and executing required commands.

```bash 
gowridv@LAPTOP-48R9ENFL:~$ git clone https://github.com/missing-semester/missing-semester sem_web 
Cloning into 'sem_web'... 
remote: Enumerating objects: 2443, done. 
remote: Counting objects: 100% (1496/1496), done. 
remote: Compressing objects: 100% (547/547), done. 
remote: Total 2443 (delta 992), reused 949 (delta 949), pack-reused 947 (from 4) 
Receiving objects: 100% (2443/2443), 15.90 MiB | 1.39 MiB/s, done. 
Resolving deltas: 100% (1437/1437), done. 
```

```bash
gowridv@LAPTOP-48R9ENFL:~$ cd ./sem_web 
gowridv@LAPTOP-48R9ENFL:~/sem_web$ git log--all-graph --decorate 
commit 0ec6a47af184a4bf4dc28891dd0d0a3234a2cd29 (HEAD -> master, origin/master, origin/HEAD) 
Author: Jason Liu <73355736+js11114@users.noreply.github.com> 
Date: Sat Apr 19 12:34:40 2025 -0400
Clarify global gitignore file must be manually created (#312) 
commit 676acd3b56ff68374759a14c5ec9955594487403 
Author: JoshL <123675538+jdlabelle@users.noreply.github.com> 
Date: Mon Mar 24 14:47:47 2025-0400 
Add suggestion and link for mapping <ESC> (#305) 
commit 542805158e948cb62381fa817faf26e572a1db4d 
Merge: f61bdc1 dce9525 
Author: Anish Athalye <me@anishathalye.com> 
Date: Sun Mar 16 08:27:59 2025-0700 
Merge branch 'georgestephenson/fix-typos-editors-data-wrangling' 
commit dce9525cb9e82b4946814ff93285f209a3bfa08e 
Author: georgestephenson <gf.s@hotmail.com> 
Date: Sun Mar 16 14:54:50 2025 +0000 
Fix Typos in Editors and Data Wrangling Lecture Notes 
commit f61bdc1d593a5261f4c1851b3e2c3dbb8e446632 
Author: Anish Athalye <me@anishathalye.com> 
Date: Sat Feb 1 10:12:19 2025 -0800 
:...skipping... 
commit 0ec6a47af184a4bf4dc28891dd0d0a3234a2cd29 (HEAD -> master, origin/master, origin/HEAD)
commit f61bdc1d593a5261f4c1851b3e2c3dbb8e446632 
Author: Anish Athalye <me@anishathalye.com> 
Date: Sat Feb 1 10:12:19 2025 -0800 
Update CI status URLs 
commit 457308e298dd41cffaaab99ea77b645854d5f2f5 
Author: Anish Athalye <me@anishathalye.com> 
Date: Sat Dec 21 08:51:49 2024 -0800 
Add autohotkey.com to ignore list 
Yet another domain that uses Cloudflare's WAF that blocks cURL. 
commit 204fb93bcfbf486b87552451cd754e3c02171ccb 
```

```bash
gowridv@LAPTOP-48R9ENFL:~/sem_web$ git log -1 README.md 
commit f61bdc1d593a5261f4c1851b3e2c3dbb8e446632 
Author: Anish Athalye <me@anishathalye.com> 
Date: Sat Feb 1 10:12:19 2025-0800 
Update CI status URLs
```

I have displayed only the Collections part from where the hash value is taken.
```bash
gowridv@LAPTOP-48R9ENFL:~/sem_web$ git blame_config.yml
a88b4eac (Anish Athalye 2020-01-17 15:26:30 -0500 18) collections: 
a88b4eac (Anish Athalye 2020-01-17 15:26:30 -0500 19) '2019': 
a88b4eac (Anish Athalye 2020-01-17 15:26:30 -050020)    output: true 
a88b4eac (Anish Athalye 2020-01-17 15:26:30 -0500 21) '2020': 
a88b4eac (Anish Athalye 2020-01-17 15:26:30 -0500 22)   output: true 
a88b4eac (Anish Athalye 2020-01-17 15:26:30 -0500 23)
```

```bash
gowridv@LAPTOP-48R9ENFL:~/sem_web$ git show a88b4eac 
commit a88b4eac326483e29bdac5ee0a39b180948ae7fc 
Author: Anish Athalye <me@anishathalye.com> 
Date: Fri Jan 17 15:26:30 2020-0500 
Redo lectures as a collection 
diff --git a/2020/index.html b/2020/index.html 
deleted file mode 100644 
index 153ddc8..0000000 
a/2020/index.html 
+++ /dev/null 
@@ -1,5 +0,0 @@
----
-layout: redirect 
-redirect: /
-title: Missing Semester 2020
----
diff --git a/2019/automation.md b/_2019/automation.md 
similarity index 100% 
rename from 2019/automation.md 
rename to _2019/automation.md 
diff --git a/2019/backups.md b/_2019/backups.md 
similarity index 100% 
rename from 2019/backups.md
```

4) Cloning a repository and modifying the index.html film
   
```bash
gowridv@LAPTOP-48R9ENFL:~$ git clone https://github.com/MdgSpace-Soc-D-2024/PicQuest aliledit 
Cloning into 'aliledit'... 
remote: Enumerating objects: 17, done. 
remote: Counting objects: 100% (17/17), done. 
remote: Compressing objects: 100% (15/15), done. 
remote: Total 17 (delta 4), reused 6 (delta 2), pack-reused 0 (from 0) 
Receiving objects: 100% (17/17), 6.28 KiB | 3.14 MiB/s, done. 
Resolving deltas: 100% (4/4), done.
```

```bash
gowridv@LAPTOP-48R9ENFL:~$ cd /aliledit 
gowridv@LAPTOP-48R9ENFL:~/aliledit$ nano index.html 
gowridv@LAPTOP-48R9ENFL:~/aliledit$ git add index.html 
gowridv@LAPTOP-48R9ENFL:~/aliledit$ git stash 
Saved working directory and index state WIP on main: 2378b58 yay 
```

```bash
gowridv@LAPTOP-48R9ENFL:~/aliledit$ git log--all --oneline 
c06d706 (refs/stash) WIP on main: 2378b58 yay 
ce06949 index on main: 2378b58 yay 
2378658 (HEAD -> main, origin/main, origin/HEAD) yay 
041960e First Modification! 
b9158ef Backend 
22588ba Update index.html 
1421432 Add files via upload
```

```bash
gowridv@LAPTOP-48R9ENFL:~/aliledit$ git stash pop 
On branch main 
Your branch is up to date with 'origin/main'. 
Changes not staged for commit: 
(use "git add <file>..." to update what will be committed) (use "git restore <file>..." to discard changes in working directory) 
modified: index.html 
no changes added to commit (use "git add" and/or "git commit -a") 
Dropped refs/stash@{0} (c06d706613be1a3cf4f149ea9eb70887a637bfef)
```

```bash
gowridv@LAPTOP-48R9ENFL:~/aliledit$ git add index.html 
gowridv@LAPTOP-48R9ENFL:~/aliledit$ git commit -m "After some stashing, changes are made" 
[main a4077db] After some stashing, changes are made 
Committer: iris <gowridv@LAPTOP-48R9ENFL.localdomain> 
Your name and email address were configured automatically based on your username and hostname. Please check that they are accurate. 
You can suppress this message by setting them explicitly: 
git config --global user.name "Your Name" 
git config --global user.email you@example.com 
After doing this, you may fix the identity used for this commit with: 
git commit --amend-reset-author 
1 file changed, 1 insertion(+), 1 deletion(-)
```

```bash
gowridv@LAPTOP-48R9ENFL:~/aliledit$ git push origin main 
Username for 'https://github.com': GowriDV 
Password for 'https://GowriDV@github.com': 
Enumerating objects: 5, done. 
Counting objects: 100% (5/5), done. 
Delta compression using up to 8 threads 
Compressing objects: 100% (3/3), done. 
Writing objects: 100% (3/3), 412 bytes | 206.00 KiB/s, done. 
Total 3 (delta 1), reused 1 (delta 0), pack-reused 
remote: Resolving deltas: 100% (1/1), completed with 1 local object. 
To https://github.com/MdgSpace-Soc-D-2024/PicQuest 
2378b58..a4077db main -> main
```

5) Aliases 

```bash
gowridv@LAPTOP-48R9ENFL:~/aliledit$ git config alias.graph "log --all-graph --decorate--oneline" 
gowridv@LAPTOP-48R9ENFL:~/aliledit$ git graph 
* a4077db (HEAD -> main, origin/main, origin/HEAD) After some stashing, changes are made 
*2378b58 yay 
* 041960e First Modification! 
* b9158ef Backend 
* 22588ba Update index.html 
* 1421432 Add files via upload
```

6) Global gitignore file to ignore OS-specific or editor-specific temporary files.

```bash
gowridv@LAPTOP-48R9ENFL:~$ git config --global core.excludesfile ~/.gitignore_global 
gowridv@LAPTOP-48R9ENFL:~$ nano ~/.gitignore_global 
gowridv@LAPTOP-48R9ENFL:~$ git config --global core.excludesfile ~/.gitignore_global 
gowridv@LAPTOP-48R9ENFL:~$ git config --global --get core.excludesfile 
/home/gowridv/.gitignore_global
```
The list of file types that are ignored:

![image](https://github.com/user-attachments/assets/ddce5043-5df3-477d-9050-3be1d73e1422)


7)

```bash
gowridv@LAPTOP-48R9ENFL:~$ git clone https://github.com/GowriDV/missing-semester typo_find 
Cloning into 'typo_find'... 
remote: Enumerating objects: 2420, done. 
remote: 
Counting objects: 100% (1494/1494), done. 
remote: Compressing objects: 100% (545/545), done. 
remote: Total 2420 (delta 991), reused 949 (delta 949), pack-reused 926 (from 4) 
Receiving objects: 100% (2420/2420), 5.32 MiB | 2.30 MiB/s, done. 
Resolving deltas: 100% (1429/1429), done.
```

```bash
gowridv@LAPTOP-48R9ENFL:~$ cd /missing-semester 
gowridv@LAPTOP-48R9ENFL:~/missing-semester$ codespell 
./Gemfile.lock:78: rouge ==> rogue 
./Gemfile.lock: 103: rouge ==> rogue 
./Gemfile.lock: 116: rouge ==> rogue 
./Gemfile.lock: 229: rouge ==> rogue 
./_config.yml:10: rouge ==> rogue 
./_2019/virtual-machines.md:58: ist ==> is, it, its, it's, sit, list 
./static/css/syntax.css:32: nd ==> and, 2nd 
./static/css/syntax.css:95: nd ==> and, 2nd 
./_2020/potpourri.md: 255: ist ==> is, it, its, it's, sit, list 
./_2020/security.md: 280: keypair ==> key pair 
./_2020/debugging-profiling.md: 106: ist ==> is, it, its, it's, sit, list
```

```bash
gowridv@LAPTOP-48R9ENFL:~/missing-semester$ git check-b typo-found 
git: 'check' is not a git command. See 'git --help'. 
The most similar command is
checkout 
gowridv@LAPTOP-48R9ENFL:~/missing-semester$ git checkout -b typo-found 
Switched to a new branch 'typo-found'
```
