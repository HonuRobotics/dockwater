# Ubuntu 18.04 with LCM for GFOE development.
FROM ubuntu:bionic

# setup timezone
RUN echo 'Etc/UTC' > /etc/timezone && \
    ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    apt-get update && \
    apt-get install -q -y --no-install-recommends tzdata && \
    rm -rf /var/lib/apt/lists/*

# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8


# Required utilities 
RUN apt update \
 && apt install -y --no-install-recommends \
        curl \
        git \
        lsb-release \
        python3-dbg \
        python3-pip \
	python3-scipy \
        python3-venv \
	python3-setuptools \
        qtbase5-dev \
        software-properties-common \
        sudo \
        wget \
 && apt clean

# LCM dependencies - see https://lcm-proj.github.io/lcm/content/build-instructions.html#build-instructions
RUN apt update \
    && apt install -y --no-install-recommends \
    build-essential \
    cmake \
    libjchart2d-java \
    libglib2.0-dev \
    openjdk-8-jdk \
    python3-dev \
    unzip \
    zip \
&& apt clean

# python-all-dev \

# LCM: Download and install from source.

ENV LCM_RELEASE=1.4.0

RUN mkdir -p /tmp/lcm \
    && curl -L https://github.com/lcm-proj/lcm/releases/download/v$LCM_RELEASE/lcm-$LCM_RELEASE.zip --output /tmp/lcm/lcm-$LCM_RELEASE.zip \
    && cd /tmp/lcm \
    && unzip  lcm-${LCM_RELEASE}.zip \
    && cd /tmp/lcm/lcm-${LCM_RELEASE} \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make \
    && sudo make install \
    && cd /tmp/lcm/lcm-${LCM_RELEASE}/lcm-python \
    && sudo python3 setup.py install