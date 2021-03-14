* Learnings *
-----------------
1. To install java on the machine:
	sudo apt-get install default-jdk
2. To install scala in command line for REPL:

-----------------------------------------------------------------------------------------------------------------------

* Linux Commands *
-----------------
1) Add user to usergroup:
	sudo usermod -aG clickhouse $USER

2) To log in to a new group: 
	newgrp <groupname>

3) To get the users in a particular group: (get entries from administrative database)
	getent group <groupname>

4) To change the owner of the directory recursively using the following command. -R stands for recursive.

  chown -R ownername foldername

5) To change group-owner only, use the command
  chgrp group_name filename

6) To make a script executable.
	chmod +x script.sh

7) To get current group name.

    id -g -n

8) To get the number of threads for a given pid:
    ps -o nlwp <pid>


netstat -ltn
tail -f /var/log/syslog
sudo lsof -i TCP:8123
top -o %MEM -d 0.1
	
-------------------------------------------------------------------------------------------

* Git Commands *
-----------------
1) Change your remote's URL from HTTPS to SSH with the git remote set-url command.

$ git remote set-url origin <remote-url>

2) List your existing remotes in order to get the name of the remote you want to change.

$ git remote -v

3) To save the stash with a custom message (https://howto.lintel.in/how-to-see-stashed-changes-using-git-stash/).

$ git stash save "changes required to run local."

4) To unstage the files that were staged using "git add".

$ git reset 

5) To discard changes in working directory

$ git checkout -- <file>...


6) Undoing a commit is a little scary if you don't know how it works. But it's actually amazingly easy if you do understand.

Say you have this, where C is your HEAD and (F) is the state of your files.

   (F)
A-B-C
    ↑
  master
You want to nuke commit C and never see it again. You do this:

git reset --hard HEAD~1
The result is:

 (F)
A-B
  ↑
master
Now B is the HEAD. Because you used --hard, your files are reset to their state at commit B.

Ah, but suppose commit C wasn't a disaster, but just a bit off. You want to undo the commit, but keep your changes for a bit of editing before you do a better commit. Starting again from here, with C as your HEAD:

   (F)
A-B-C
    ↑
  master
You can do this, leaving off the --hard:

git reset HEAD~1
In this case the result is:

   (F)
A-B-C
  ↑
master
In both cases, HEAD is just a pointer to the latest commit. When you do a git reset HEAD~1, you tell Git to move the HEAD pointer back one commit. But (unless you use --hard) you leave your files as they were. So now git status shows the changes you had checked into C. You haven't lost a thing!

For the lightest touch, you can even undo your commit, but leave your files and your index:

git reset --soft HEAD~1
This not only leaves your files alone, it even leaves your index alone. When you do git status, you'll see that the same files are in the index as before. In fact, right after this command, you could do git commit and you'd be redoing the same commit you just had.

One more thing: Suppose you destroy a commit as in the first example, but then discover you needed it after all? Tough luck, right?

Nope, there's still a way to get it back. Type git reflog, and you'll see a list of (partial) commit SHA-1 hashes that you've moved around in. Find the commit you destroyed, and do this:

git checkout -b someNewBranchName shaYouDestroyed
You've now resurrected that commit. Commits don't actually get destroyed in Git for some 90 days, so you can usually go back and rescue one you didn't mean to get rid of.

7) To rename the branch name.
 git branch -m <oldname> <newname>
