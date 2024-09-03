FROM ubuntu:24.04

ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
  apt-get install -y build-essential \
    make wget git \
    lsb-release \
    libssl-dev \
    pkg-config \
    patchelf \
    sudo \
	&& rm -rf /var/lib/apt/lists/*

ENV UID=1000
ENV UNAME=bringauto
# Since Ubuntu24.04, there is default user 'ubuntu' with UID 1000
RUN usermod -l $UNAME ubuntu
RUN echo "$UNAME  ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER $UNAME
WORKDIR /home/$UNAME

RUN mkdir CMake/ && cd CMake &&  \
    wget https://github.com/Kitware/CMake/releases/download/v3.30.3/cmake-3.30.3-linux-x86_64.sh && \
    bash cmake-3.30.3-linux-x86_64.sh --skip-license --prefix=./
ENV PATH=$PATH:/home/$UNAME/CMake/bin/

RUN git clone https://github.com/cmakelib/cmakelib.git
ENV CMLIB_DIR=/home/$UNAME/cmakelib
