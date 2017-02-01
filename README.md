# mariadb-mmr-practice 

MariaDB Multi-Master Replication practice using Docker.

## Prerequisite

* [Docker](https://www.docker.com/)
* [VirtualBox](https://www.virtualbox.org/)
* [Ansible](http://docs.ansible.com/)

## Build

Create two docker machine for master1 and master2
    
    $ docker-machine create --driver virtualbox master1
    $ eval $(docker-machine env master1)
    $ docker-compose up --build -d

    $ docker-machine create --driver virtualbox master2
    $ eval $(docker-machine env master2)
    $ docker-compose up --build -d

Get the IP addresses of the docker machines, type `docker-machine ls`, the output will be like below

    $ docker-machine ls
    NAME      ACTIVE   DRIVER       STATE     URL                         SWARM   DOCKER    ERRORS
    master1   -        virtualbox   Running   tcp://192.168.99.100:2376           v1.13.0
    master2   -        virtualbox   Running   tcp://192.168.99.101:2376           v1.13.0

Create `inventory` contained SSH connection information of the machines for ansible delpoyment. The infomation are constructed at `Dockerfile` and `docker-compose.yml`, which

* username: `root`
* password: `123`
* SSH port: `2222`

    $ vi hosts
    master1 ansible_ssh_host=192.168.99.100 ansible_ssh_port=2222 ansible_ssh_user=root ansible_ssh_pass=123
    master2 ansible_ssh_host=192.168.99.101 ansible_ssh_port=2222 ansible_ssh_user=root ansible_ssh_pass=123

Run ansible command to deploy

    $ ansible-playbook -i inventory playbook.yml

