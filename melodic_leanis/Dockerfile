FROM dockwater:melodic
# Set Ubuntu release
ARG RELEASE=bionic

# Set ROS distribution
ARG DIST=melodic

# Set Gazebo verison
ARG GAZ=gazebo9

# LEANIS
# FAU-FAPS adaptive_motion_control
RUN apt update && apt install -y --no-install-recommends \
    python-catkin-tools \
    ros-${DIST}-joint-trajectory-controller \
    ros-${DIST}-position-controllers \
    ros-${DIST}-velocity-controllers \	
    ros-${DIST}-graph-msgs \
    ros-${DIST}-moveit-visual-tools \
    ros-${DIST}-mavros \
    ros-${DIST}-moveit \
    ros-${DIST}-moveit-servo \
    ros-${DIST}-vrpn \
    ros-${DIST}-simple-message \
    && apt clean

# LEANIS Ardupilot
RUN apt update && apt install -y --no-install-recommends \
    ros-${DIST}-mavros \
    geographiclib-tools \
    python-future \
    && apt clean

RUN /bin/bash /opt/ros/melodic/lib/mavros/install_geographiclib_datasets.sh

# Moveit tutorials
RUN apt update && apt install -y --no-install-recommends \
 ros-${DIST}-pcl-ros \
 ros-${DIST}-franka-ros \
 && apt clean

# Utilities
RUN apt update && apt install -y --no-install-recommends \
  ros-${DIST}-plotjuggler-ros