

# Required utilities
RUN apt update \
 && apt install -y --no-install-recommends \
        build-essential \
	ca-certificates \	
        cmake \
        cppcheck \
        curl \
        git \
        gnupg2 \
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
	tzdata \
        wget \
 && apt -qq clean


# dockwater
Docker images used across multiple repositories supporting simulation of water-related robotics

## Distributions
This repository supports baseline images for running Gazebo on the following ROS distributions:

* Galactic (Ubuntu 20.04 Focal Fossa / ROS 2 Galactic Geochelone / Ignition Fortress)
* Noetic (Ubuntu 20.04 Focal Fossa / ROS Noetic Ninjemys / Gazebo 11)
* Melodic (Ubuntu 18.04 Bionic Beaver / ROS Melodic Morenia / Gazebo 9)
* Kinetic (Ubuntu 18.04 Xenial Xerus / ROS Kinetic Kame / Gazebo 7)

## Dockerhub
The latest images corresponding to each of the three distributions above are stored in the [`npslearninglab/watery_robots` repository on Dockerhub](https://hub.docker.com/r/npslearninglab/watery_robots).

## Build Instructions
Build the base image with the `build.bash` script. 
```
DIST=(noetic | melodic | kinetic)
./build.bash ${DIST}
```
Run the image locally using the `run.bash` script:
```
./run.bash ${DIST}:latest
```

## Build for CI
To build an image for use in continuous integration pipelines, we need to use a slightly different `rocker` command from the one that's called in the `run.bash` script. The reason is to avoid pulling in local user information or mounting the local home directory.

```
rocker --dev-helpers --nvidia --user --user-override-name=developer ${image_name}
```
**Note**: The `--user-override-name` option is currently only available in the latest build (following the rocker [Development installation instructions](https://github.com/osrf/rocker#development)).

## Tag and push
The image resulting from the `rocker` command will be unnamed. To push to a repository, look up the ID with `docker image ls` and apply the appropriate tag:
```
docker tag <ID> <repository_namespace>/<repository>:<tag>
docker push <repository_namespace>/<repository>:<tag>
```
