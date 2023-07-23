## Git - Version Control System(VCS) / Source Code Management(SCM)


### Commands

1. Change your remote's URL from HTTPS to SSH with the git remote set-url command.

> git remote set-url origin <remote-url>

2. List your existing remotes in order to get the name of the remote you want to change.

> git remote -v

3. To save the stash with a custom message (https://howto.lintel.in/how-to-see-stashed-changes-using-git-stash/)

> git stash save "changes required to run local."

4. To unstage the files that were staged using "git add".

> git reset

5. To discard changes in working directory

> git checkout -- [files]


6. Undoing a commit is a little scary if you don't know how it works. But it's actually amazingly easy if you do understand.

```
Say you have this, where C is your HEAD and (F) is the state of your files.

   (F)
A-B-C
    ↑
  master

You want to nuke commit C and never see it again. You do this:

>> git reset --hard HEAD~1

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

>> git reset HEAD~1

In this case the result is:

   (F)
A-B-C
  ↑
master

In both cases, HEAD is just a pointer to the latest commit. When you do a git reset HEAD~1, you tell Git to move the HEAD pointer back one commit. But (unless you use --hard) you leave your files as they were. So now git status shows the changes you had checked into C. You haven't lost a thing!

For the lightest touch, you can even undo your commit, but leave your files and your index:

> git reset --soft HEAD~1

This not only leaves your files alone, it even leaves your index alone. When you do git status, you'll see that the same files are in the index as before. In fact, right after this command, you could do git commit and you'd be redoing the same commit you just had.

One more thing: Suppose you destroy a commit as in the first example, but then discover you needed it after all? Tough luck, right?

Nope, there's still a way to get it back. Type git reflog, and you'll see a list of (partial) commit SHA-1 hashes that you've moved around in. Find the commit you destroyed, and do this:

> git checkout -b someNewBranchName shaYouDestroyed

You've now resurrected that commit. Commits don't actually get destroyed in Git for some 90 days, so you can usually go back and rescue one you didn't mean to get rid of.
```

7. To rename the branch.

> git branch -m <oldname> <newname>

8. To view information about previous commits that have occurred in a project. 

```
git log

git log --oneline

git log -n 5 => gives the 5 latest commits.

git log --since==2020-01-01

git log --untill==2020-01-01

git log --author=="Ravi"

git log --grep="Bugfix"
```

9. To get and set repository or global configurations

```
git config --system

git config --global

git config --global color.ui true

git config --global core.editor "vim"
```

10. **git diff** is a multi-use Git command that when executed runs a diff function on Git data sources

View changes on staged changes:

> git diff --staged (or) git diff --cached

> git diff --color-words

Compare commits: 
> git diff <old_commit>..<new_commit>

11. To rename the file using git

>>git mv <old_name> <new_name>

12. git rm command deletes files both from the Git repository as well as the filesystem. Using the --cached flag, the actual file on disk will not be deleted.

> git rm <file_name>

13. View the changes of a previous commit:

> git show <SHA value of commit>

14. To list the tree of contents that is being tracked. 

> git ls-tree HEAD

15. To remove untracked/unstaged files (careful - destructive action):

To dry run
> git clean -n

To execute
> git clean -f 

16. To amend the commits (Not recommended unless you are changing the latest commit as it won't break the chain)

> git commit --amend -m "commit message"

17. To revert a commit

> git revert <Old commit SHA>

18. To go to an old verison of a file.

> git checkout <old commit SHA> -- <file_name>

Retrieve Old Versions:
- Git only recommends amending the most recent commit.
- Edits which undo changes should be new commits.
- But may be it is helpful to retrieve and old verison of a file for refernce.

19. To switch back and forth different branches multiple times.
>  git checkout -

So, when switching to the previous branch you just need to write **git checkout -** . Switching back and forth different branches means, you only have to write **git checkout -** once every time you want to switch to the other branch.

20. Most likely you have used **git add .** before to add every file you changed to the commit at once. But what if you want to be more selective of what you want to commit? Or what if you want to go one by one of every changes you have made before committing?

> git add -p

The -p stands for “patch”. Using **git add -p** you don’t add all your changes at once but in small “patches” that you can decide whether you want to add to your commit or not. Git will ask you for every patch whether you want to add or not. You decide by typing y for “yes” or n for “no”.



### Making Atomic commits is best practice:
- Small commits
- Only a single aspect.
- Easier to understand, to work with, and to fix bugs.
- Improves collaboration.

### Ignore Files:
- Use .gitignore file
- We can just add files names, basic regular expresssions
- We can add comments in .gitignore file using #
- Ignore Tracked Files: To ignore already tracked files
	- git rm --cached <file_name>
- **Track empty directories:**
	- Usually git ignores the directories that doesn't have files in it.
	- To track them we add **.gitkeep** file in the empty directory.
	- Now the git starts tracking the empty folder.


### Git Subtrees:
- Subtree merges insert the external project's code into a separate sub-directory within your repo. This has a detailed process to set up and then is very easy for other users, because it is automatically included when the repository is checked out or cloned. This can be a convenient way to include a dependency in your project.

- It is easy to pull changes from the other project, but complicated to submit changes back. And if the other project have to merge from your code, the project histories get merged and the two projects effectively become one.

- While adding the subtree squash the history so that the entire sbutree wont't come.

### Git Submodules:
- Git submodules (manual) link to a particular commit in another project's repository, much like svn:externals with an -r argument. Submodules are easy to set up, but all users have to manage the submodules, which are not automatically included in checkouts (or clones).
- Although it is easy to submit changes back to the other project, doing so may cause problems if the repo has changed. Therefore it is generally not appropriate to submit changes back to a project that is under active development.
-  While pulling the superproject we need to run extra command for submodules to get the data (git submodule update --init).

- While pushing there is a high chance to mess up the things. if A pushes the superproject which references the x commit of the submodule and B pushes the superproject which referencees the y commit of the submodule then it will be hell to resolve the merge conflicts.

- If we don't push the chnages of submodule before pushing the superproject then the superproject will be referencing the commit of submodule which hasn't been pushed at all. Then if someone clones the superproject there will be an error.


### References:

- https://medium.com/kodehauz/basic-git-commands-with-examples-8c145949b1bd
- https://faun.pub/understanding-git-basics-commands-tips-tricks-da0c05db411f
- https://medium.com/edureka/git-commands-with-example-7c5a555d14c