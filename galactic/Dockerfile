# Ubuntu 20.04 
FROM ros:galactic-ros-base-focal

# Setup timezone
ENV TZ=Etc/UTC
RUN echo $TZ > /etc/timezone && \
  ln -fs /usr/share/zoneinfo/$TZ /etc/localtime
  
# Tools necessary and useful during development
RUN apt-get update && \
 DEBIAN_FRONTEND=noninteractive \
 apt-get install --no-install-recommends -y \
        build-essential \
        atop \
	ca-certificates \
        cmake \
        cppcheck \
	curl \
        expect \
        gdb \
        git \
	gnupg2 \
        gnutls-bin \
	iputils-ping \
        libbluetooth-dev \
        libccd-dev \
        libcwiid-dev \
	libeigen3-dev \
        libfcl-dev \
        libgflags-dev \
        libgles2-mesa-dev \
        libgoogle-glog-dev \
        libspnav-dev \
        libusb-dev \
	lsb-release \
	net-tools \
	pkg-config \
        protobuf-compiler \
        python3-dbg \
        python3-empy \
        python3-numpy \
        python3-setuptools \
        python3-pip \
        python3-venv \
	ruby \
        software-properties-common \
	sudo \
        vim \
	wget \
	xvfb \
 && apt-get clean -qq

# Setup locale
RUN sudo apt update && sudo apt install locales \
  && sudo locale-gen en_US en_US.UTF-8 \
  && sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

ARG ROSDIST=galactic
ARG IGNDIST=fortress
ENV IGNITION_VERSION fortress

# Install ignition fortress and ROS2 Desktop
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
     ignition-${IGNDIST} \
     ros-${ROSDIST}-desktop \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean -qq

# Install some 'standard' ROS packages and utilities.
RUN apt update \
  && apt install -y --no-install-recommends \
     python3-colcon-common-extensions \
     python3-vcstool \
     ros-${ROSDIST}-radar-msgs \
     ros-${ROSDIST}-ament-cmake-pycodestyle \
     ros-${ROSDIST}-xacro \
     ros-${ROSDIST}-image-transport \
     ros-${ROSDIST}-mavros-msgs \
     ros-${ROSDIST}-image-transport-plugins \
     ros-${ROSDIST}-rqt-graph \
     ros-${ROSDIST}-rqt-image-view \
     ros-${ROSDIST}-rqt-plot \
     ros-${ROSDIST}-rqt-topic \
     ros-${ROSDIST}-rviz2 \
  && sudo rm -rf /var/lib/apt/lists/* \
  && sudo apt-get clean -qq

## Customize your image here.

