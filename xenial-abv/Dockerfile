FROM ubuntu:xenial

# Set Ubuntu release
ARG RELEASE=xenial

# Required utilities 
RUN apt update \
 && apt install -y --no-install-recommends \
        build-essential \
        cmake \
        cppcheck \
        curl \
        git \
        gnupg \
        libgles2-mesa-dev \
        lsb-release \
        pkg-config \
        software-properties-common \
        sudo \
        wget \
 && apt clean


# Fixing TimeZone problem reported in VRX 2019
RUN export DEBIAN_FRONTEND=noninteractive \
 && apt update \
 && apt install -y \
    tzdata \
 && ln -fs /usr/share/zoneinfo/America/Los_Angeles /etc/localtime \
 && dpkg-reconfigure --frontend noninteractive tzdata \
 && apt clean
