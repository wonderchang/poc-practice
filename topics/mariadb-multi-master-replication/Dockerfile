# System image
FROM ubuntu:16.04

# Set locale and timezone
RUN \
  locale-gen en_US.UTF-8 && \
  update-locale LANG=en_US.UTF-8 && \
  ln -fs /usr/share/zoneinfo/Asia/Taipei /etc/localtime

# Installation SSH server
RUN \
  apt-get update && \
  apt-get install -y openssh-server

ARG USER
ARG AUTHORIZED_KEY_PATH
RUN \
  useradd -ms /bin/bash $USER && \
  mkdir -p /home/$USER/.ssh

RUN echo $AUTHORIZED_KEY_PATH
ADD $AUTHORIZED_KEY_PATH /home/$USER/.ssh/authorized_keys

RUN chown -R $USER:$USER /home/$USER/.ssh

# Run SSH service
RUN mkdir /var/run/sshd
RUN echo 'root:123' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
