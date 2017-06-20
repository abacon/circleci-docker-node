FROM circleci/node:6.11.0

MAINTAINER chinesedewey@gmail.com

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN sudo apt-get update \
  && sudo apt-get install -y software-properties-common \
  && sudo add-apt-repository -y ppa:fkrull/deadsnakes \
  && sudo apt-get update \
  && sudo apt-get install -y \
    curl \
    git-all \
    python3.6 \
    python3.6-dev \
    python3.6-venv \
    wget \
  && apt-get clean

