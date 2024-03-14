FROM ubuntu:22.04

ENV TZ=Europe/Prague
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
  apt-get install -y build-essential \
    make wget git \
    gcc \
    g++ \
    python3 \
    python3-pip \
	&& rm -rf /var/lib/apt/lists/*

ARG UID=1000
ARG UNAME=bringauto

RUN useradd -m -u $UID -s /bin/bash $UNAME
RUN usermod --groups sudo -a $UNAME
RUN echo "$UNAME  ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER $UNAME
WORKDIR /home/$UNAME

RUN mkdir CMake/ && cd CMake &&  \
    wget https://github.com/Kitware/CMake/releases/download/v3.26.4/cmake-3.26.4-linux-x86_64.sh && \
    bash cmake-3.26.4-linux-x86_64.sh --skip-license --prefix=./
ENV PATH=$PATH:/home/$UNAME/CMake/bin/

RUN git clone https://github.com/cmakelib/cmakelib.git
ENV CMLIB_DIR=/home/$UNAME/cmakelib
