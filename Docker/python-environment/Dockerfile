FROM ubuntu:24.04

ENV TZ=Europe/Prague
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
  apt-get install -y \
    wget git \
    python3 \
    python3-pip \
    libssl-dev \
    pkg-config \
    sudo \
	&& rm -rf /var/lib/apt/lists/*

ENV UID=1000
ENV UNAME=bringauto
# Since Ubuntu24.04, there is default user 'ubuntu' with UID 1000
RUN usermod -l $UNAME ubuntu
RUN echo "$UNAME  ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER $UNAME
WORKDIR /home/$UNAME
