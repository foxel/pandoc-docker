FROM ubuntu:14.04

ENV DEBIAN_FRONTEND=noninteractive

RUN \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        texlive-latex-recommended texlive-fonts-recommended lmodern \
        wget libgmp10 && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /build

RUN \
    wget --no-check-certificate -O /tmp/pandoc.deb \
        "https://github.com/jgm/pandoc/releases/download/1.17.0.2/pandoc-1.17.0.2-1-amd64.deb" && \
    dpkg -i /tmp/pandoc.deb && \
    rm /tmp/pandoc.deb

VOLUME /build

WORKDIR /build

ENTRYPOINT ["pandoc"]
