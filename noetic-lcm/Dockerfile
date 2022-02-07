# Must build the noetic base image first
FROM dockwater:noetic

# LCM prereq's
RUN apt update \
 && apt install -y --no-install-recommends \
    	autoconf \
	automake \
	freeglut3-dev \
	g++ \
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
 cd / && rm -rf lcm-$LCM_RELEASE.zip lcm-$LCM_RELEASE
 