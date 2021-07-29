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

# Runs a docker container with the image created by build.bash
# Requires:
#   docker
#   nvidia-docker
#   an X server
#   rocker
# Recommended:
#   A joystick mounted to /dev/input/js0 or /dev/input/js1
############################################################
# Help                                                     #
############################################################
Help()
{
   # Display Help
   echo "Runs a docker container with the image created by build.bash."
   echo
   echo "Syntax: scriptTemplate [-c|s|t|h]"
   echo "options:"
   echo "c     Add cuda library support."
   echo "s     Create an image with novnc for use with cloudsim."
   echo "t     Create a test image for use with CI pipelines."
   echo "h     Print this help message and exit."
   echo
}


JOY=/dev/input/js0
CUDA=""
ROCKER_ARGS="--devices $JOY --dev-helpers --nvidia --x11 --user --home --git"

while getopts ":csth" option; do
  case $option in
    c) # enable cuda library support 
      CUDA="--cuda ";;
    s) # Build cloudsim image
      ROCKER_ARGS="--cuda --nvidia --novnc --turbovnc --user --user-override-name=developer";;
    t) # Build test image for Continuous Integration 
      echo "Building CI image"
      ROCKER_ARGS="--cuda --dev-helpers --nvidia --user --user-override-name=developer";;
    h) # print this help message and exit
      Help
      exit;; 
  esac
done

IMG_NAME=${@:$OPTIND:1}

# Split off ':latest' from IMG_NAME
IFS=':' read -ra NAMES <<< "$IMG_NAME"
CONTAINER_NAME="${NAMES[0]}_runtime"
ROCKER_ARGS="${ROCKER_ARGS} --name $CONTAINER_NAME"
echo "Using image <$IMG_NAME> to start container <$CONTAINER_NAME>"

rocker ${CUDA} ${ROCKER_ARGS} $IMG_NAME 
