FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y && apt install -yq --no-install-recommends \
    apt-utils \
    curl \
    wget \
    openssh-client \
    ca-certificates \
    apt-cacher-ng \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

VOLUME ["/var/cache/apt-cacher-ng"]
EXPOSE 3142
CMD    chmod 777 /var/cache/apt-cacher-ng && /etc/init.d/apt-cacher-ng start && tail -f /var/log/apt-cacher-ng/*
