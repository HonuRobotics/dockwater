# Must build the noetic base image first
FROM dockwater:noetic

# LCM, FVS and AVS prereq's and other useful tools
RUN apt update \
 && apt install -y --no-install-recommends \
    	autoconf \
	automake \
	freeglut3-dev \
	g++ \
	iputils-ping \
	iputils-tracepath \
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
	libtool \
	openjdk-8-jdk \
	python3-serial \
	texinfo \
	txt2man \
	unzip \
	zip \
 && apt clean
	
#ENV LCM_RELEASE '1.4.0'
ENV LCM_RELEASE '1.3.1'
ENV LCM_INSTALL_DIR "/usr/local/lib"

# Install LCM from source.
# If we use latest release (v1.4.0 from Aug. 2018) we get
# Deprecation warnings with Python3
# - see https://github.com/lcm-proj/lcm/issues/347
RUN wget https://github.com/lcm-proj/lcm/archive/refs/heads/master.zip && \
 unzip -q master.zip && \
 cd lcm-master && \
 mkdir build && cd build && cmake .. && \
 make install && ldconfig && \
 cd ./lcm-python && make &&  \
 cd / && rm -rf lcm-master.zip lcm-master


# configure pkgconfig to find LCM
ENV PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$LCM_INSTALL_DIR/pkgconfig

# Install libbot2 - for bot-lcm-tunnel
# Informed by https://github.com/ripl/libbot2-docker
# BSB had to fork the upsteam repo to make a small change
RUN wget https://github.com/bsb808/libbot2/archive/refs/heads/focal-dev.zip && \
 unzip -q focal-dev.zip && \
 cd libbot2-focal-dev && \
 make BUILD_PREFIX=/usr/local && \
 cd / && rm -rf libbot2-focal-dev focal-dev.zip

# Install libconfig

RUN wget https://github.com/hyperrealm/libconfig/archive/refs/tags/v1.7.1.zip &&\
 unzip -q v1.7.1.zip && \
 cd libconfig-1.7.1 && \
 autoreconf && \
 ./configure && \
 make && \
 make install && \
 cd / && rm -rf libconfig-1.7.1 v1.7.1.zip
 