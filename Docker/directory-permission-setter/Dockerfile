FROM ubuntu:24.04

ARG UID=5000
ARG UNAME=bringauto

RUN useradd -m -u $UID -s /bin/bash $UNAME
RUN usermod --groups sudo -a $UNAME
RUN echo "$UNAME  ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

ENV DIRECTORIES_TO_SET=""
ENV UNAME=$UNAME
ENV UID=$UID

COPY ./directory-permission-setter/set_directory_permissions.sh /home/$UNAME/set_directory_permissions.sh
RUN chmod +x /home/$UNAME/set_directory_permissions.sh

WORKDIR /home/$UNAME

ENTRYPOINT ["bash", "-c", "/home/$UNAME/set_directory_permissions.sh"]