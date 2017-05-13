# Build Virtual Cluster by Docker Machine

## Build

The build create two SSH server `server1` and `server2`.

    $ ./build.sh

The build flow:

1. Check the virtual machine is exist or not
2. Create virtual machine by VirtualBox
3. Create a container as a simple SSH server with the first admin user `ubuntu/ubuntu`

## Demo

List the server IP

    $ docker-machine ls

```
NAME      ACTIVE   DRIVER       STATE     URL                         SWARM   DOCKER        ERRORS
server1   -        virtualbox   Running   tcp://192.168.99.xxx:2376           v17.05.0-ce
server2   -        virtualbox   Running   tcp://192.168.99.yyy:2376           v17.05.0-ce
```

Login to `server1` and then ping to `server2`,

    $ ssh ubuntu@192.168.99.xxx -p 2222

```
$ ping 192.168.99.113
PING 192.168.99.113 (192.168.99.113) 56(84) bytes of data.
64 bytes from 192.168.99.113: icmp_seq=1 ttl=63 time=0.586 ms
64 bytes from 192.168.99.113: icmp_seq=2 ttl=63 time=0.299 ms
...
```

    $ exit

vice versa is fine.login to `server2 and then ping to `server1`
