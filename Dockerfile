FROM ubuntu:14.04.4

MAINTAINER chinesedewey@gmail.com

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update \
  && apt-get install -y software-properties-common \
  && add-apt-repository -y ppa:fkrull/deadsnakes \
  && apt-get update \
  && apt-get install -y \
    curl \
    git-all \
    python3.6 \
    python3.6-dev \
    python3.6-venv \
    wget \
  && apt-get clean

RUN curl -sL https://deb.nodesource.com/setup_6.x > /tmp/install_node \
  && bash /tmp/install_node \
  && apt-get install -y nodejs \
  && apt-get clean \
  && rm /tmp/install_node
