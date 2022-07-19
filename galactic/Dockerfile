FROM ros:galactic-ros-base

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
        libgflags-dev \
        libgles2-mesa-dev \
        lsb-release \
        pkg-config \
        protobuf-compiler \
        python3-dbg \
        python3-colcon-common-extensions \
        python3-pip \
        python3-scipy \
        python3-vcstool \
        python3-venv \
        qtbase5-dev \
        ruby \
        software-properties-common \
        sudo \
        wget \
 && apt clean

RUN sudo apt update && sudo apt install locales \
  && sudo locale-gen en_US en_US.UTF-8 \
  && sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

RUN sudo apt update \
  && sudo apt upgrade -y \
  && sudo apt install -y --no-install-recommends ros-galactic-desktop 

RUN sudo apt update \
  && sudo apt install -y --no-install-recommends \
     $(sort -u $(find . -iname 'packages-'`lsb_release -cs`'.apt' -o -iname 'packages.apt' | grep -v '/\.git/') | sed '/ignition\|sdf/d' | tr '\n' ' ')

RUN sudo wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null \
  && sudo apt update \
  && sudo apt install -y --no-install-recommends ignition-fortress

# Optional: Dev. tools, applications, etc.
RUN apt-get update && apt-get install -y --no-install-recommends \
    gdb \
    psmisc \
    vim \
    && rm -rf /var/lib/apt/lists/*

## Customize your image here.
#
#
RUN sudo apt update \
   && sudo apt install -y --no-install-recommends \
      ros-galactic-mavros* 
