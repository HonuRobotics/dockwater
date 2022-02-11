# Must build the noetic base image first
FROM dockwater:noetic

# LCM prereq's and other useful tools
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
	unzip \
	zip \
 && apt clean
	
#ENV LCM_RELEASE '1.4.0'
ENV LCM_RELEASE '1.3.1'
ENV LCM_INSTALL_DIR "/usr/local/lib"

# Install LCM
RUN wget https://github.com/lcm-proj/lcm/releases/download/v$LCM_RELEASE/lcm-$LCM_RELEASE.zip && \
 unzip -q lcm-$LCM_RELEASE.zip && \
 cd lcm-$LCM_RELEASE && \
# v1.4.0 introduces cmake
# mkdir build && cd build && cmake .. && \
# v1.3.1 doesn't use cmake
 ./configure && make && \
 make install && ldconfig && \
 cd ./lcm-python && python3 setup.py install &&  \
 cd / && rm -rf lcm-$LCM_RELEASE.zip lcm-$LCM_RELEASE


# configure pkgconfig to find LCM
ENV PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$LCM_INSTALL_DIR/pkgconfig

# Install libbot2 - for bot-lcm-tunnel
# Informed by https://github.com/ripl/libbot2-docker
#RUN wget https://github.com/libbot2/libbot2/archive/refs/heads/master.zip && \
# unzip -q master.zip && \
# cd libbot2-master && \
# make BUILD_PREFIX=/usr/local && \
# cd / && rm -rf libbot2-master master.zip