#!/usr/bin/env bash
#
# Typical usage: ./join.bash <container_name>
#
# Note that running: docker container ls
# will give a list of running containers.

CONTAINER_ID=$1

xhost +
docker exec --privileged -e DISPLAY=${DISPLAY} -e LINES=`tput lines` -it ${CONTAINER_ID} bash
xhost -
