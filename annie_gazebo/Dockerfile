# Must build the noetic base image first
FROM dockwater:noetic

# Deduced Project11 dependencies
RUN apt update && apt install -y --no-install-recommends \
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
    ros-noetic-grid-map \
    ros-noetic-perception-pcl \
    ros-noetic-nmea-msgs \
    ros-noetic-behaviortree-cpp \
    && rm -rf /var/lib/apt/lists/*
    
# Stuff used for Project 12.  The latex packages take up a lot of space.
RUN apt update && apt install -y --no-install-recommends \
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
