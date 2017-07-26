FROM ubuntu:14.04.4

MAINTAINER chinesedewey@gmail.com

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ENV PATH "${PATH}:/opt/aws_cli_venv/bin"

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

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash \
  && bash -c 'nvm install v8.2.1' \
  && bash -c 'nvm use v8.2.1'

RUN python3.6 -m venv /opt/aws_cli_venv \
  && /opt/aws_cli_venv/bin/pip install --upgrade awscli \
  && rm -r /root/.cache/pip
