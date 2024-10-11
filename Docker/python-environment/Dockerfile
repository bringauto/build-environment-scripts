FROM ubuntu:24.04

ENV TZ=Europe/Prague
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
  apt-get install -y \
    wget git \
    python3 \
    python3-pip \
    python3-venv \
    libssl-dev \
    pkg-config \
    sudo \
	&& rm -rf /var/lib/apt/lists/*

ARG UID=5000
ARG UNAME=bringauto

RUN useradd -m -u $UID -s /bin/bash $UNAME
RUN usermod --groups sudo -a $UNAME
RUN echo "$UNAME  ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Virtual environments are required, because later versions of python do not allow installing packages globally
# PYTHON_ENVIRONMENT_PYTHON3 has to be used to when using python3 in docker images to avoid using the system python3
ENV PYTHON_ENVIRONMENT_PYTHON3=/home/$UNAME/venv/bin/python3
COPY ./python-environment/python_warning.sh /home/$UNAME/python_warning.sh
RUN chmod +x /home/$UNAME/python_warning.sh

USER $UNAME
RUN python3 -m venv --copies /home/$UNAME/venv

USER root
RUN update-alternatives --install /usr/bin/python3 python3 /home/$UNAME/python_warning.sh 1

USER $UNAME
WORKDIR /home/$UNAME
