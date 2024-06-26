# Ubuntu 24.04
FROM ros:jazzy-ros-base-noble

ENV DEBIAN_FRONTEND=noninteractive

# Setup timezone
ENV TZ=Etc/UTC
RUN echo $TZ > /etc/timezone && \
        ln -fs /usr/share/zoneinfo/$TZ /etc/localtime

# Tools necessary and useful during development
RUN apt-get -q update \
        && apt-get -q -y upgrade \
        && apt-get -q install --no-install-recommends -y \
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
        && apt clean -qq

# Setup locale
RUN sudo apt update && sudo apt install locales \
        && sudo locale-gen en_US en_US.UTF-8 \
        && sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 \
        && export LANG=en_US.UTF-8

ARG ROSDIST=jazzy
ARG GZDIST=harmonic
ENV GZ_VERSION harmonic

# Install Gazebo and ROS2 Desktop
RUN sudo wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg \
        && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null \
        && sudo apt-get -q update \
        && sudo apt-get -y --quiet --no-install-recommends install \
        gz-${GZDIST} \
        ros-${ROSDIST}-desktop \
        && sudo apt-get autoremove -y \
        && sudo apt-get clean -y \
        && sudo rm -rf /var/lib/apt/lists/*

# Install some 'standard' ROS packages and utilities.
RUN sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list' \
        && wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add - \
        && sudo apt-get -q update \
        && sudo apt-get -q -y upgrade \
        && sudo apt-get -q install --no-install-recommends -y \
        libsdformat14 \
        python3-colcon-common-extensions \
        python3-vcstool \
        ros-${ROSDIST}-actuator-msgs \
        ros-${ROSDIST}-ament-cmake-pycodestyle \
        ros-${ROSDIST}-image-transport \
        ros-${ROSDIST}-image-transport-plugins \
        ros-${ROSDIST}-joy-teleop \
        ros-${ROSDIST}-joy-linux \
        ros-${ROSDIST}-mavros-msgs \
        ros-${ROSDIST}-radar-msgs \
        ros-${ROSDIST}-ros-gz \
        ros-${ROSDIST}-rqt-graph \
        ros-${ROSDIST}-rqt-image-view \
        ros-${ROSDIST}-rqt-plot \
        ros-${ROSDIST}-rqt-topic \
        ros-${ROSDIST}-rviz2 \
        ros-${ROSDIST}-xacro \
        && sudo apt-get autoremove -y \
        && sudo apt-get clean -y \
        && sudo rm -rf /var/lib/apt/lists/*
