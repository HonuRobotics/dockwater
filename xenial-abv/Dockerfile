FROM ubuntu:xenial

# Set Ubuntu release
ARG RELEASE=xenial

# Required utilities 
RUN apt update \
 && apt install -y --no-install-recommends \
    	autoconf \
	automake \
        build-essential \
        cmake \
        cppcheck \
        curl \
	freeglut3-dev \
	g++ \
        git \
	libboost-dev \
    	libboost-date-time-dev \
    	libboost-system-dev \
   	libboost-filesystem-dev \
	libboost-thread-dev \
	libgflags-dev \
        libgles2-mesa-dev \
	libglib2.0-dev \
	libgoogle-glog-dev \
	libgtk2.0-dev \
	libjpeg8-dev \
	libncurses5-dev \
	libpng12-dev \
	libtool \
    	libyaml-cpp-dev \
	libxmu-dev \
        lsb-release \
	openjdk-8-jdk \
        pkg-config \
	python-dev \
	python-numpy \
	python-scipy python-matplotlib ipython \
	python-setuptools \
        software-properties-common \
        sudo \
	texinfo \
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

# libbot2 - for bot-lcm-tunnel
# Informed by https://github.com/ripl/libbot2-docker
RUN wget https://github.com/libbot2/libbot2/archive/refs/heads/master.zip && \
 unzip -q master.zip && \
 cd libbot2-master && \
 make BUILD_PREFIX=/usr/local && \
 cd / && rm -rf libbot2-master master.zip
 
RUN wget https://github.com/hyperrealm/libconfig/archive/refs/tags/v1.7.1.zip &&\
 unzip -q v1.7.1.zip && \
 cd libconfig-1.7.1 && \
 autoreconf && \
 ./configure && \
 make && \
 make install && \
 cd / && rm -rf libconfig-1.7.1 v1.7.1.zip
 
 
 
