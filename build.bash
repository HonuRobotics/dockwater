#!/usr/bin/env bash

#
# Copyright (C) 2018 Open Source Robotics Foundation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#

# Builds a Docker image.
image_name=$(basename $1)

if [ $# -lt 1 ]
then
    echo "Usage: $0 <path to directory containing Dockerfile>"
    exit 1
fi

if [ ! -f "${1}"/Dockerfile ]
then
    echo "Err: Directory does not contain a Dockerfile to build."
    exit 1
fi

BUILD_BASE=""

# If noetic (default)
if [ "$1" == "noetic" ]
then
  BUILD_BASE="--build-arg BASEIMG=ros:noetic-ros-base \
              --build-arg RELEASE=focal \
              --build-arg DIST=noetic \
              --build-arg GAZ=gazebo11"
fi

# If melodic (default)
if [ "$1" == "melodic" ]
then
  BUILD_BASE="--build-arg BASEIMG=ros:melodic-ros-base \
              --build-arg RELEASE=bionic \
              --build-arg DIST=melodic \
              --build-arg GAZ=gazebo9"
fi

# If kinetic (default)
if [ "$1" == "kinetic" ]
then
  BUILD_BASE="--build-arg BASEIMG=ros:kinetic-ros-base \
              --build-arg RELEASE=xenial \
              --build-arg DIST=kinetic \
              --build-arg GAZ=gazebo7"
fi

# Option key
POSITIONAL=()
while [[ $# -gt 0 ]]
do
case $2 in
    -w|--without-nvidia)
    if [ "$1" == "noetic" ]
    then
      BUILD_BASE="--build-arg BASEIMG=nvidia/cudagl:11.3.0-devel \
                  --build-arg RELEASE=focal \
                  --build-arg DIST=noetic \
                  --build-arg GAZ=gazebo11"
    fi
    if [ "$1" == "melodic" ]
    then
      BUILD_BASE="--build-arg BASEIMG=nvidia/cudagl:11.3.0-devel-ubuntu18.04 \
                  --build-arg RELEASE=focal \
                  --build-arg DIST=noetic \
                  --build-arg GAZ=gazebo11"
    fi
    echo "Building Docker image based on NVIDIA cudagl (CUDA + Opengl) base image"
    shift
    ;;
    *)    # unknown option
    POSITIONAL+=("$1")
    shift
    ;;
esac
done

echo $BUILD_BASE

image_plus_tag=$image_name:$(export LC_ALL=C; date +%Y_%m_%d_%H%M)
docker build --rm -t $image_plus_tag -f "${1}"/Dockerfile $BUILD_BASE "${1}" && \
docker tag $image_plus_tag $image_name:latest && \
echo "Built $image_plus_tag and tagged as $image_name:latest"
echo "To run:"
echo "./run.bash $image_name:latest"
