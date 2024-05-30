# Must build the noetic base image first
FROM dockwater:noetic

# Deduced Project11 dependencies
RUN add-apt-repository -y ppa:ubuntugis/ppa && apt update && apt install -y --no-install-recommends \
    gdal-bin \
    libpq-dev \
    libgdal-dev \
    qtpositioning5-dev \
    libqt5svg5-dev \
    python3-future \
    ros-noetic-pid \
    ros-noetic-smach \
    ros-noetic-smach-ros \
    ros-noetic-audio-common \
    ros-noetic-roslint \
    ros-noetic-twist-mux \
    && rm -rf /var/lib/apt/lists/*
    
# Optional stuff
RUN apt update && apt install -y --no-install-recommends \
    ipython3 \
    nano

# source the ROS stuff so you don't have to repeat that every login
# source /opt/ros/noetic/setup.bash
# taken from https://answers.ros.org/question/370439/how-to-source-setupbash-in-a-ros2-dockerfile/
RUN . /opt/ros/noetic/setup.sh

# source ~/project12_ws/devel/setup.bash
# can't figure out a way to reference the home directory ... 
#RUN . ~/project12_ws/devel/setup.sh 
