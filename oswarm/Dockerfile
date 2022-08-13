# Must build the noetic base image first
FROM dockwater:noetic

## Customization for optical_swarm project
ARG DIST=noetic
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-${DIST}-vision-opencv \
    && apt clean