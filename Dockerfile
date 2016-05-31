FROM ubuntu:14.04

ENV DEBIAN_FRONTEND=noninteractive

RUN \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        pandoc texlive-latex-recommended texlive-fonts-recommended lmodern && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /build

VOLUME /build

WORKDIR /build

ENTRYPOINT ["pandoc"]
