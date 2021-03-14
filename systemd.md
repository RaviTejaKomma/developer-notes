Cheatsheet
These are the commands you’re probably going to use the most:

# systemctl start [name.service]
# systemctl stop [name.service]
# systemctl restart [name.service]
# systemctl reload [name.service]
$ systemctl status [name.service]
# systemctl is-active [name.service]
$ systemctl list-units --type service --all


Systemd commands:
---------------------
systemctl stop [servicename]
systemctl disable [servicename]
rm /etc/systemd/system/[servicename]
rm /etc/systemd/system/[servicename] symlinks that might be related
systemctl daemon-reload
systemctl reset-failed
systemctl --type=service

https://blog.miguelgrinberg.com/post/running-a-flask-application-as-a-service-with-systemd

https://ajayrajnelapudi.github.io/
