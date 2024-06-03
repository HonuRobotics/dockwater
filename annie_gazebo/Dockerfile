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
    
# Stuff used for Project 12.  The latex packages take up a lot of space.
RUN apt update && apt install -y --no-install-recommends \
    ipython3 \
    jstest-gtk \
    latexmk \
    nano \ 
    plantuml \
    ros-noetic-rosdoc-lite \
    ros-noetic-smach-viewer \  
    texlive-latex-extra \
    texlive-fonts-recommended
    
    
# source the ROS stuff so you don't have to repeat that every login
RUN . /opt/ros/noetic/setup.sh

# Note: Add a line such as 'source ~/project12_ws/devel/setup.bash' to your
# local .bashrc file to setup the ROS source packages.


