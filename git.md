## Git - Version Control System(VCS) / Source Code Management(SCM)

Keeps track of changes
	Version1, Version2, Version3

### Configuration

System level configuration <br>
/etc/gitconfig <br>
Program files\Git\etc\gitconfig

	>> git config --system

#### User level configuration
```
~/.gitconfig
$HOME\.gitconfig
git config --global
```

Project level configuration
	my_project/.git/config

	>> git config

git config --global color.ui true
git config --global core.editor "vim"

Configure git-auto-completion

Talk about git help

Write commit messages in present tense.

git log -n 5 - gives the 5 latest commits.
git log --since==2020-01-01
git log --untill==2020-01-01
git log --author=="Ravi"
git log --grep="Bugfix"

Git Three Tree architecture:

	Repository
~	
|				|
commit  	checkout
|				|
				~
	Working


		Repository
~	
|							|
git commit file.txt  	checkout
|							|
							~
		Staging Index
~	
|						|	
git add file.txt  	checkout
|						|
						~
		Working

We can make changes to 10 files in our working directory and then selectively commit 5 of the changes as one set. That's why it is staging.



git add
git commit -m
git status
git diff - Usually compares between working and staging copies.

View changes on staged changes: 
git diff --staged (or) git diff --cached

git diff --color-words

It is permanently removed but you can get it back using git:
git rm <file_name>

To rename the file using git:
git mv <old_name> <new_name>

View the changes of a previous commit:
git show <SHA value of commit>

Compare commits:
git diff <old_commit>..<new_commit>

git log --oneline
 
Making Atomic commits is best practice:
	- Small commits
	- Only a single aspect.
	- Easier to understand, to work with, and to fix bugs.
	- Improves collaboration.


Undo Changes:

In working directory to discard changes in working directory:
git checkout -- <file_name> 

In Staging directory to unstage: 
git reset HEAD <fiel_name> 

In Repository to amend the commits (Not recommended unless you are changing the latest commit as it won't break the chain):
git commit --amend -m "commit message"

Retrieve Old Versions:
	- Git only recommends amending the most recent commit.
	- Edits which undo changes should be new commits.
	- But may be it is helpful to retrieve and old verison of a file for refernce.
	- To go to an old verison of a file.
	git checkout <old commit SHA> -- <file_name>

Revert a commit:
git revert <Old commit SHA>

Remove Untracked/UnStaged Files (Careful - Destructive action):
git clean -n => To dry run
git clean -f => To execute

Ignore Files:
	- Use .gitignore file
	- We can just add files names, basic regular expresssions
	- We can add comments in .gitignore file using #
	- Ignore Tracked Files: To ignore already tracked files
		- git rm --cached <file_name>
	- Track empty directories:
		- Usually git ignores the directories that doesn't have files in it.
		- To track them we add .gitkeep file in the empty directory.
		- Now the git starts tracking the empty folder.


To list the tree of contents that is being tracked. 
git ls-tree HEAD






Git has two approaches similar to, but not exactly equivalent to svn:externals:

Subtrees:
Subtree merges insert the external project's code into a separate sub-directory within your repo. This has a detailed process to set up and then is very easy for other users, because it is automatically included when the repository is checked out or cloned. This can be a convenient way to include a dependency in your project.
It is easy to pull changes from the other project, but complicated to submit changes back. And if the other project have to merge from your code, the project histories get merged and the two projects effectively become one.

Submodules:
Git submodules (manual) link to a particular commit in another project's repository, much like svn:externals with an -r argument. Submodules are easy to set up, but all users have to manage the submodules, which are not automatically included in checkouts (or clones).
Although it is easy to submit changes back to the other project, doing so may cause problems if the repo has changed. Therefore it is generally not appropriate to submit changes back to a project that is under active development.



Git modules:

1) While pulling the superproject we need to run extra command for submodules to get the data (git submodule update --init).

2) While pushing there is a high chance to mess up the things. if A pushes the superproject which references the x commit of the submodule and B pushes the superproject which referencees the y commit of the submodule then it will be hell to resolve the merge conflicts.

3) If we don't push the chnages of submodule before pushing the superproject then the superproject will be referencing the commit of submodule which hasn't been pushed at all. Then if someone clones the superproject there will be an error.

Git Subtree:

1) While adding the subtree squash the history so that the entire sbutree wont't come.


### Git Commands
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
