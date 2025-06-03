level 0 to 1 
command: ssh bandit0@bandit.labs.overthewire.org  -p2220
pwd: bandit0
to find password: cat readme

level 1 to 2
command: ssh bandit1@bandit.labs.overthewire.org -p2220
put password 0
command: cat ./- ( this will give pwd of level 2)

level 2 to 3
command: ssh bandit2@bandit.labs.overthewire.org -p2220
put password of  level 1


level 3 to 4
command : ssh bandit3@bandit.labs.overthewire.org -p2220
put password of level 2
command: cd inhere
        ls -a
        cat .hidden

level 4 to 5 
command: ssh bandit4@bandit.labs.overthewire.org -p2220
put of level 3
command : cd inhere
          ls
         use file*
view and see pwd of level 5 
exit and loging to bandit 5 

level 5 to 6 
command:  ssh bandit5@bandit.labs.overthewire.org -p2220   
           put level 4 pwd
find the file using find
           do then cat to find pwd of bandit 6

level 6 to 7
  command:  ssh bandit6@bandit.labs.overthewire.org -p2220  
           locate the file and read it to find bandit 7 pwd
           and exit bandit 6 and loging 7

  level 7 to 8 
  command:  ssh bandit7@bandit.labs.overthewire.org -p2220  
           
           
           
           

           




