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

# Usage function
display_usage() {
    echo "Usage:

./build.bash [--prefix PREFIX | -p PREFIX] DOCKERFILE_PATH

Example:./build.bash --prefix my_side_project noetic 

./build.bash --prefix my_side_project noetic 

Image name is concatenation of PREFIX and DOCKERFILE_PATH
"
}

# Process command line arguments
POSITIONAL_ARGS=()
PREFIX=""
while [[ $# -gt 0 ]]; do
  case $1 in
    -p|--prefix)
	PREFIX="$2"
	shift # past argument
	shift # past value
	;;
    -h|--help)
	display_usage
	exit
	;;
    -*|--*)
	echo "Unknown option $1"
	display_usage
	exit 1
	;;
    *)
	POSITIONAL_ARGS+=("$1") # save positional arg
	shift # past argument
	;;
  esac
done

set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters

# Make sure we have at the one positional argumant.
if [ $# -lt 1 ]
then
    display_usage
    exit 1
fi

# Create image name
DOCKERFILE_PATH=$1
SUFFIX=$(basename $DOCKERFILE_PATH)
IMAGE_NAME="${PREFIX}${SUFFIX}"
echo "Building <${IMAGE_NAME}> from Docker file at <${DOCKERFILE_PATH}>."

if [ ! -f "${DOCKERFILE_PATH}"/Dockerfile ]
then
    echo "Err: Directory  <${DOCKERFILE_PATH}> does not contain a Dockerfile to build."
    exit 1
fi

IMAGE_PLUS_TAG=$IMAGE_NAME:$(export LC_ALL=C; date +%Y_%m_%d_%H%M)
docker build --rm -t $IMAGE_PLUS_TAG -f "${DOCKERFILE_PATH}"/Dockerfile "${DOCKERFILE_PATH}" && \
docker tag $IMAGE_PLUS_TAG $IMAGE_NAME:latest && \
echo "Built $IMAGE_PLUS_TAG and tagged as $IMAGE_NAME:latest"
echo "To run:"
echo "./run.bash $IMAGE_NAME:latest"
