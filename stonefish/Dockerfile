# Must build the noetic base image first
FROM dockwater:noetic

# Stonefish
RUN apt update \
 && apt install -y --no-install-recommends \
  libglm-dev libsdl2-dev libfreetype6-dev \
  ros-noetic-geometry ros-noetic-pcl-ros
  && apt clean

# COLA2 Example
# https://bitbucket.org/iquarobotics/cola2_lib/src/master/
sudo apt install libboost-thread-dev libboost-date-time-dev libboost-filesystem-dev libeigen3-dev libtinyxml-dev python python3 lcov

DIST=noetic
sudo apt install ros-${DIST}-rosbridge-server ros-${DIST}-joy lm-sensors lcov python3-ruamel.yaml ros-${DIST}-diagnostic-aggregator