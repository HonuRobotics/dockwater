# dockwater

Tools to simplify creation and use of Docker containers for development and production.  

See [wiki](https://github.com/HonuRobotics/dockwater/wiki) for detailed use instructions.


This project includes the following:

1. Project-specific development container Dockerfiles, many of wich use ROS and Gazebo.
1. Bash scripts to build images and run/join containers for interactive development environment - a thin wrapper for [rocker](https://github.com/osrf/rocker) functions.
1. Documentation on common use-cases for developing inside of docker containers.

## Base Development Environments

The `main` branch of the repository supports baseline images for with ROS and Gazebo:

* Humble (Ubuntu 22.04 Jammy Jellyfish / ROS 2 Humble Hawksbill / Gazebo Garden)
* Galactic (Ubuntu 20.04 Focal Fossa / ROS 2 Galactic Geochelone / Ignition Fortress)
* Noetic (Ubuntu 20.04 Focal Fossa / ROS Noetic Ninjemys / Gazebo 11)
* Melodic (Ubuntu 18.04 Bionic Beaver / ROS Melodic Morenia / Gazebo 9)
* Kinetic (Ubuntu 18.04 Xenial Xerus / ROS Kinetic Kame / Gazebo 7)

## Project-Specific Environments

Extending the base development environments is done by adding a branch to the repository, typically with the `PROJECT-dev` naming convention.  For example, the `gfoe-dev` branch is for a project that uses [LCM](https://github.com/lcm-proj/lcm), addition to the base environment.

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
