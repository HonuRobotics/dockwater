# Ubuntu 20.04 with nvidia-docker2 beta opengl support
# This is what MBZIRC uses as a base.
FROM nvidia/opengl:1.0-glvnd-devel-ubuntu20.04

RUN apt-get update \
 && apt-get install --no-install-recommends -y \
    sudo \
    wget \
    gnupg2 \
    lsb-release \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/* \
 && apt-get -qq clean

  
# Setup timezone
RUN echo 'Etc/UTC' > /etc/timezone && \
  ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime \
  && apt-get -qq update && apt-get -q -y install tzdata \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get -qq clean

# Tools useful during development
RUN apt-get update -qq \
 && apt-get install --no-install-recommends -y -qq \
        build-essential \
        atop \
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
	net-tools \
	pkg-config \
        protobuf-compiler \
        python3-dbg \
        python3-empy \
        python3-numpy \
        python3-setuptools \
        python3-pip \
        python3-venv \
        software-properties-common \
        vim \
	xvfb \
 && apt-get clean -qq

# Setup locale
RUN sudo apt update && sudo apt install locales \
  && sudo locale-gen en_US en_US.UTF-8 \
  && sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

# Set up ros2 repo
RUN /bin/sh -c 'curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg' \
  && /bin/sh -c 'echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null'

ARG ROSDIST=galactic
ARG IGNDIST=fortress

# Install ignition fortress and ROS2 Desktop
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
     ignition-${IGNDIST} \
     ros-${ROSDIST}-desktop \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean -qq

# Install rosdep
RUN apt-get update \
  && apt install -y python3-rosdep \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean -qq \
  && rosdep init \
  && rosdep update

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
     ros-${ROSDIST}-ros-ign \
     ros-${ROSDIST}-rqt-graph \
     ros-${ROSDIST}-rqt-image-view \
     ros-${ROSDIST}-rqt-plot \
     ros-${ROSDIST}-rqt-topic \
     ros-${ROSDIST}-rviz2 \
  && sudo rm -rf /var/lib/apt/lists/* \
  && sudo apt-get clean -qq

ENV IGNITION_VERSION fortress

## Customize your image here.
