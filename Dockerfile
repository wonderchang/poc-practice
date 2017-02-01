# System image
FROM ubuntu:16.04

# Set locale
RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8

# Set timezone
RUN ln -fs /usr/share/zoneinfo/Asia/Taipei /etc/localtime

# Installation 
RUN apt-get update
RUN apt-get install -y build-essential openssh-server vim git zip unzip sudo python python-dev python-pip python-virtualenv libcurl4-openssl-dev libssl-dev

# Run SSH service
RUN mkdir /var/run/sshd
RUN echo 'root:123' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
