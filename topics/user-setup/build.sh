#!/bin/bash
set -e
HOSTNAME="server"
USERNAME="ubuntu"
PASSWORD="ubuntu"

# Build container
if [ "$(/usr/local/bin/docker-machine ls | grep "^$HOSTNAME " | cut -d' ' -f1)" == "$HOSTNAME" ]; then
  echo "Host $HOSTNAME already exists"
  /usr/local/bin/docker-machine rm $HOSTNAME
fi

/usr/local/bin/docker-machine create --driver virtualbox $HOSTNAME
eval $(docker-machine env $HOSTNAME)
/usr/local/bin/docker-compose up --build -d

# Deploy the user initialization
ip=$(/usr/local/bin/docker-machine ls | grep "^$HOSTNAME " | awk '{print $5}' | grep -o "192\.168\.[0-9]*\.[0-9]*")
echo "$HOSTNAME ansible_ssh_host=$ip ansible_ssh_port=2222 ansible_ssh_user=$USERNAME ansible_ssh_pass=$PASSWORD ansible_become_pass=$PASSWORD" > inventory
/usr/local/bin/ansible-playbook -i inventory playbook.yml
