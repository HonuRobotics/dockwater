# Ubuntu 20.04 with nvidia-docker2 beta opengl support
FROM osrf/mbzirc:mbzirc_models_latest

USER root

ARG DEBIAN_FRONTEND=noninteractive

# Tools useful during development
RUN apt-get update -qq \
 && apt-get install --no-install-recommends -y -qq \
        build-essential \
        atop \
        cmake \
        cppcheck \
        expect \
        gdb \
        git \
        gnutls-bin \
        libbluetooth-dev \
        libccd-dev \
        libcwiid-dev \
        libfcl-dev \
        libgoogle-glog-dev \
        libspnav-dev \
        libusb-dev \
        python3-dbg \
        python3-empy \
        python3-numpy \
        python3-setuptools \
        python3-pip \
        python3-venv \
        software-properties-common \
        vim \
        net-tools \
        iputils-ping \
        xvfb \
        curl \
 && apt-get clean -qq

# set up ros2 repo
RUN /bin/sh -c 'curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg' \
  && /bin/sh -c 'echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null'

# install ignition fortress
RUN apt-get update \
  && apt-get install -y ignition-fortress \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean -qq

# install rosdep
RUN apt-get update \
  && apt install -y python3-rosdep \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean -qq \
  && rosdep init \
  && rosdep update

# install ROS2
RUN apt-get update \
  && apt-get install -y ros-galactic-ros-base \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean -qq

# install colcon
RUN apt-get -qq update && apt-get -q -y install \
  python3-vcstool \
  python3-colcon-common-extensions \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get -qq clean

ENV IGNITION_VERSION fortress

# rosdep install
# In the MBZIRC Dockerfile used something like...
# rosdep install -r --from-paths src -i -y --rosdistro galactic \
# Instead, from mbzirc_ws we run ...
# rosdep check  -r --from-paths src -i -y --rosdistro galactic
# to generate this list

ARG DIST=galactic

RUN apt update \
  && apt install -y --no-install-recommends \
     ros-${DIST}-radar-msgs \
     ros-${DIST}-ament-cmake-pycodestyle \
     ros-${DIST}-xacro \
     ros-${DIST}-image-transport \
     ros-${DIST}-mavros-msgs \
     ros-${DIST}-image-transport-plugins \
     ros-${DIST}-rqt-image-view \
     ros-${DIST}-rqt-plot \
     ros-${DIST}-rqt-topic \
     ros-${DIST}-rviz2 \
  && sudo rm -rf /var/lib/apt/lists/* \
  && sudo apt-get clean -qq

# Some additional ROS 2 packages

RUN apt update \
  && apt install -y --no-install-recommends \
     ros-${DIST}-rqt-graph \
     ros-${DIST}-ros-ign \
  && sudo rm -rf /var/lib/apt/lists/* \
  && sudo apt-get clean -qq