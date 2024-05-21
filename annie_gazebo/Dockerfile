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
    && rm -rf /var/lib/apt/lists/*
    
# Optional stuff
RUN apt update && apt install -y --no-install-recommends \
    ipython3