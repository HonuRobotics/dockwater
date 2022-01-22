FROM ubuntu:xenial

# Set Ubuntu release
ARG RELEASE=xenial

# Required utilities 
RUN apt update \
 && apt install -y --no-install-recommends \
    	autoconf \
        build-essential \
        cmake \
        cppcheck \
        curl \
	g++ \
        git \
	libboost-dev \
    	libboost-date-time-dev \
    	libboost-system-dev \
   	libboost-filesystem-dev \
	libgflags-dev \
        libgles2-mesa-dev \
	libglib2.0-dev \
	libgoogle-glog-dev \
	libncurses5-dev \
	libtool \
    	libyaml-cpp-dev \
        lsb-release \
	openjdk-8-jdk \
        pkg-config \
	python-dev \
	python-numpy \
	python-scipy python-matplotlib ipython \
	python-setuptools \
        software-properties-common \
        sudo \
	unzip \
        wget \
	zip \
 && apt clean


# Fixing TimeZone problem reported in VRX 2019
RUN export DEBIAN_FRONTEND=noninteractive \
 && apt update \
 && apt install -y \
    tzdata \
 && ln -fs /usr/share/zoneinfo/America/Los_Angeles /etc/localtime \
 && dpkg-reconfigure --frontend noninteractive tzdata \
 && apt clean

# Some of below inspired by Matt Walter's project:
# https://github.com/ripl/lcm-docker

#ENV LCM_VERSION 'master'
ENV LCM_RELEASE '1.4.0'
ENV LCM_INSTALL_DIR "/usr/local/lib"

# LCM
RUN wget https://github.com/lcm-proj/lcm/releases/download/v$LCM_RELEASE/lcm-$LCM_RELEASE.zip && \
 unzip -q lcm-$LCM_RELEASE.zip && \
 cd lcm-$LCM_RELEASE && mkdir build && cd build && cmake .. && \
 make install && ldconfig && \
 cd / && rm -rf lcm-$LCM_RELEASE.zip lcm-$LCM_RELEASE
 
# configure pkgconfig to find LCM
ENV PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$LCM_INSTALL_DIR/pkgconfig
