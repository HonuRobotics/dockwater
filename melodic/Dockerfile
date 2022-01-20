FROM ros:melodic-ros-base

# Set Ubuntu release
ARG RELEASE=bionic

# Set ROS distribution
ARG DIST=melodic

# Set Gazebo verison
ARG GAZ=gazebo9

# Required utilities 
RUN apt update \
 && apt install -y --no-install-recommends \
        build-essential \
        cmake \
        cppcheck \
        curl \
        git \
        gnupg \
        libeigen3-dev \
        libgles2-mesa-dev \
        lsb-release \
        pkg-config \
        protobuf-compiler \
        python3-dbg \
        python3-pip \
	python3-scipy \
        python3-venv \
        qtbase5-dev \
        ruby \
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

# Get ROS and Gazebo (note keyserver queries are very unreliable in bionic for some reason)
RUN /bin/sh -c 'echo "deb http://packages.ros.org/ros/ubuntu ${RELEASE} main" > /etc/apt/sources.list.d/ros1-latest.list' \
 && wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add - \
 && /bin/sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable ${RELEASE} main" > /etc/apt/sources.list.d/gazebo-stable.list' \
 && wget  https://packages.osrfoundation.org/gazebo.key  -O - | sudo apt-key add - \
 && apt update \
 && apt install -y --no-install-recommends \
    ${GAZ} \
    lib${GAZ}-dev \
    python-vcstool \
    ros-${DIST}-gazebo-plugins \
    ros-${DIST}-gazebo-ros \
    ros-${DIST}-gazebo-ros-control \
    ros-${DIST}-gazebo-ros-pkgs \
    ros-${DIST}-effort-controllers \
    ros-${DIST}-geographic-info \
    ros-${DIST}-hector-gazebo-plugins \
    ros-${DIST}-joint-state-controller \
    ros-${DIST}-joint-state-publisher \
    ros-${DIST}-joy \
    ros-${DIST}-joy-teleop \
    ros-${DIST}-kdl-parser-py \
    ros-${DIST}-key-teleop \
    ros-${DIST}-move-base \
    ros-${DIST}-robot-localization \
    ros-${DIST}-robot-state-publisher \
    ros-${DIST}-ros-base \
    ros-${DIST}-rqt \
    ros-${DIST}-rqt-common-plugins \
    ros-${DIST}-rqt-robot-plugins \
    ros-${DIST}-rviz \
    ros-${DIST}-teleop-tools \
    ros-${DIST}-teleop-twist-joy \
    ros-${DIST}-teleop-twist-keyboard \
    ros-${DIST}-tf2-geometry-msgs \
    ros-${DIST}-tf2-tools \
    ros-${DIST}-urdfdom-py \
    ros-${DIST}-velodyne-gazebo-plugins \
    ros-${DIST}-velodyne-simulator \
    ros-${DIST}-xacro \
 && apt clean

RUN pip3 install numpy

# Optional: Dev. tools, applications, etc.
RUN apt-get update && apt-get install -y --no-install-recommends \
    gdb \
    psmisc \
    vim \
    && rm -rf /var/lib/apt/lists/*

## Customize your image here.
#
#
## ...
