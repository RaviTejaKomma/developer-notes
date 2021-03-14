Git - Version Control System(VCS) / Source Code Management(SCM)

Keeps track of changes
	Version1, Version2, Version3

Configuration

System level configuration
	/etc/gitconfig
	Program files\Git\etc\gitconfig

	>> git config --system

User level configuration
	~/.gitconfig
	$HOME\.gitconfig

	>> git config --global

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