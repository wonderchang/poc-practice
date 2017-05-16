# User Setup using Ansible

	$ ./build.sh

Build info:

* Docker Machine: `server`
* Docker Image: [wonderchang/poc-practice-ubuntu-ssh](https://hub.docker.com/r/wonderchang/poc-practice-ubuntu-ssh/) ([Dockerfile](../../dockerfiles/ubuntu-ssh/Dockerfile))
* SSH Service port: `2222`
* Admin User: `ubuntu/ubuntu`

Build procedure:

1. Add a new group `wheel` with root pivilage
2. Add user `foo` within `wheel` group
3. Add user `bar`

## Demo

Lookup the server IP

```
$ docker-machine ls
NAME     ACTIVE   DRIVER       STATE     URL                         SWARM   DOCKER   ERRORS
server   -        virtualbox   Running   tcp://192.168.99.xxx:2376           v17.05.0-ce
```

Login by `foo` user and try to switch to root

```
$ ssh foo@192.168.99.xxx -p 2222
foo@192.168.99.117's password:
Welcome to Ubuntu 16.04.2 LTS (GNU/Linux 4.4.66-boot2docker x86_64)

* Documentation:  https://help.ubuntu.com
* Management:     https://landscape.canonical.com
* Support:        https://ubuntu.com/advantage
Last login: Tue May 16 03:45:15 2017 from 192.168.99.1
foo@07e44b622211:~$ sudo su
[sudo] password for foo:
root@07e44b622211:/home/foo#
```

Login by `bar` user and try to switch to root

```
$ ssh bar@192.168.99.117 -p 2222
bar@192.168.99.117's password:
Welcome to Ubuntu 16.04.2 LTS (GNU/Linux 4.4.66-boot2docker x86_64)

* Documentation:  https://help.ubuntu.com
* Management:     https://landscape.canonical.com
* Support:        https://ubuntu.com/advantage
Last login: Tue May 16 05:23:11 2017 from 192.168.99.1
bar@07e44b622211:~$ sudo su
[sudo] password for bar:
bar is not in the sudoers file.  This incident will be reported.
bar@07e44b622211:~$
```

## Reference
* [user - Manage user accounts — Ansible Documentation](http://docs.ansible.com/ansible/user_module.html)
* [group - Add or remove groups — Ansible Documentation](http://docs.ansible.com/ansible/group_module.html)
* [Ansible: best practice for maintaining list of sudoers](http://stackoverflow.com/questions/33359404/ansible-best-practice-for-maintaining-list-of-sudoers)
* [Wheel (Unix term)](https://en.wikipedia.org/wiki/Wheel_(Unix_term))