FROM ubuntu-latest as base

ARG VER
RUN \
    apt update -y && \
    apt install -yqq \
     ca-certificates \
     wget \
     curl \
     telnet \
     gpg \
     apt-transport-https &&\
    apt clean && \
    wget https://github.com/nokian5500/docker-nanominer/releases/download/3.8.5/nanominer-linux-3.8.5.tar.gz && \
    tar xzvf nanominer-linux-3.8.5.tar.gz && \
    mv nanominer-linux-3.8.5.tar.gz nanominer

WORKDIR /nanominer

CMD ["/nanominer/nanominer","/nanominer/config.ini"]
