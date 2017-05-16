#!/bin/bash
set -e
HOSTS=(server1 server2)
for host in "${HOSTS[@]}"
do
  if [ "$(/usr/local/bin/docker-machine ls | grep "^$host" | cut -d' ' -f1)" == "$host" ]; then
    echo "Host $host already exists"
    /usr/local/bin/docker-machine rm $host
  fi

  /usr/local/bin/docker-machine create --driver virtualbox $host
  eval $(docker-machine env $host)
  /usr/local/bin/docker-compose up --build -d
done
