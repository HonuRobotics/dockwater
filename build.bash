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

# Default
image_name="noetic"



if [ $# -lt 1 ]
then
    echo "Building default image <${image_name}>"
    read -p "Are you sure this is the image you want to build [y/n]? " -n 1 -r
    echo    # (optional) move to a new line
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
	exit 1
    fi
else
    image_name=$(basename $1)
fi

if [ ! -f "${image_name}"/Dockerfile ]
then
    echo "Err: Directory does not contain a Dockerfile to build."
    exit 1
fi

image_plus_tag=$image_name:$(export LC_ALL=C; date +%Y_%m_%d_%H%M)
docker build --rm -t $image_plus_tag -f "${image_name}"/Dockerfile "${image_name}" && \
docker tag $image_plus_tag $image_name:latest && \
echo "Built $image_plus_tag and tagged as $image_name:latest"
echo "To run:"
echo "./run.bash $image_name:latest"
