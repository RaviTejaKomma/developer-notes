## Command Line

### Linux Commands

1. Add user to usergroup

```bsh
sudo usermod -aG clickhouse $USER
```

2. To log in to a new group

```bash
newgrp <groupname>
```

3. To get the users in a particular group: (get entries from administrative database.

```bash
getent group <groupname>
```

4. To change the owner of the directory recursively using the following command. -R stands for recursive.

```bash
chown -R ownername foldername
```

5. To change group-owner only, use the command

```bash
chgrp group_name filename
```

6. To make a script executable.

```bash
chmod +x script.sh
```

7. To get current group name.

```bash
id -g -n
```

8. To get the number of threads for a given pid

```bash
ps -o nlwp <pid>
```

**Other handy commands:**
> netstat -ltn

> tail -f /var/log/syslog

> sudo lsof -i TCP:8123

> top -o %MEM -d 0.1

### Aliases

Some aliases that make my life easier. If you are using Bash, open the ~/.bashrc file and add the following aliases to it. 

```bash

## Aliases fot git commands ##
alias ga="git add ."
alias gb="git branch"
alias gc="git commit -m $1"
alias gd="git diff"
alias gp="git pull"
alias gs="git status"

## Aliases for switching between work and personal dev directories ##
alias work="cd ~/Documents/work/"
alias dev="cd ~/Documents/programming"
alias ..="cd .."
```

To switch between your work and personal development cloud configuration.

```bash
alias gcp_work='gcloud config set account <work_mail_address>; gcloud config set project <project-id>'

alias gcp_dev='gcloud config set account <personal_mail_address>; gcloud config set project <project-id>'
```

after adding the aliases to the file and saving it, run to preserve your current shell

> source ~/.bashrc


### Additional references:
- https://levelup.gitconnected.com/advanced-unix-commands-to-boost-your-productivity-4af6e9086c04