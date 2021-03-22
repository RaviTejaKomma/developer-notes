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