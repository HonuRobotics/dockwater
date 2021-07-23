# dockwater
Docker images used across multiple repositories supporting simulation of water-related robotics

## Distributions
This repository supports baseline images for running Gazebo on the following ROS distributions:
* Noetic (Ubuntu 20.04 Focal Fossa / ROS Noetic Ninjemys / Gazebo 11)
* Melodic (Ubuntu 18.04 Bionic Beaver / ROS Melodic Morenia / Gazebo 9)
* Kinetic (Ubuntu 18.04 Xenial Xerus / ROS Kinetic Kame / Gazebo 7)

## Build Instructions
```
DIST=(noetic | melodic | kinetic)
./build.bash ${DIST}
```

## Rocker command
```
rocker --dev-helpers --nvidia --user --user-override-name=developer ${image_name}
```
**Note**: The `--user-override-name` option is currently only available in the latest build (following the rocker [Development installation instructions](https://github.com/osrf/rocker#development)).


