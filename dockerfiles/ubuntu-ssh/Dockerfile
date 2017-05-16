# System image
FROM ubuntu:16.04

MAINTAINER Wonder Chang <iwonder.tw@gmail.com>

# Install openssh server
RUN apt-get update
RUN apt-get install -y openssh-server sudo iputils-ping python python-dev python-pip python-virtualenv vim

# Set first user
RUN /usr/sbin/useradd -m ubuntu -s /bin/bash && /bin/echo "ubuntu:ubuntu" | chpasswd
RUN /bin/echo "ubuntu ALL=(ALL:ALL) ALL" >> /etc/sudoers.d/ubuntu

# Run SSH service
RUN mkdir /var/run/sshd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
