FROM ubuntu:22.04

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

RUN useradd -m -u $UID -s /bin/bash $UNAME
RUN usermod --groups sudo -a $UNAME
RUN echo "$UNAME  ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER $UNAME
WORKDIR /home/$UNAME
