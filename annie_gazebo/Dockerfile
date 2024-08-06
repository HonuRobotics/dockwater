# Must build the noetic base image first
FROM dockwater:noetic

# Deduced Project11 and Project 12 dependencies
RUN add-apt-repository -y ppa:ubuntugis/ppa && apt update && apt install -y --no-install-recommends \
    gdal-bin \
    libpq-dev \
    libgdal-dev \
    qtpositioning5-dev \
    libqt5svg5-dev \
    python3-future \
    ros-noetic-behaviortree-cpp \
    ros-noetic-grid-map \
    ros-noetic-nmea-msgs \
    ros-noetic-pcl-ros \
    ros-noetic-pid \
    ros-noetic-rviz-map-plugin \	
    ros-noetic-smach \
    ros-noetic-smach-ros \
    ros-noetic-audio-common \
    ros-noetic-roslint \
    ros-noetic-twist-mux \
    ros-noetic-grid-map \
    ros-noetic-perception-pcl \
    ros-noetic-nmea-msgs \
    ros-noetic-behaviortree-cpp \
    && rm -rf /var/lib/apt/lists/*
    
# Stuff used for Project 12.  The latex packages take up a lot of space.
RUN apt update && apt install -y --no-install-recommends \
    iputils-ping \
    ipython3 \
    jstest-gtk \
    latexmk \
    nano \
    tree \ 
    plantuml \
    ros-noetic-rosdoc-lite \
    ros-noetic-smach-viewer \  
    texlive-latex-extra \
    texlive-fonts-recommended
    
# Update the package list and upgrade all packages.  Otherwise you get an rviz error in Andy's demo: https://bitbucket.org/gfoe/project12/wiki/Visualize%20Radar%20in%202022-12-05-19-31-15_hover_while_fishing_boat_goes_by
RUN apt-get update && apt-get dist-upgrade -y

# Download and install SAE J1939 python module
RUN mkdir -p /tmp/j1939 \
    && curl -L https://bitbucket.org/gfoe/j1939/raw/04419f3a4130a381dd0a2e67aaa46c3556927880/j1939.tar.bz2 --output /tmp/j1939/j1939.tar.bz2 \
    && cd /tmp/j1939 \
    && tar jxf j1939.tar.bz2 \
    && cd j1939 \
    && sudo python3 setup.py install

# source the ROS stuff so you don't have to repeat that every login
RUN . /opt/ros/noetic/setup.sh
