# Ubuntu 22.04 
# First build dockwater:humble
FROM dockwater:humble


ARG GZDIST=garden
ENV GZ_VERSION=garden

# Set up repo to install Ignition
#RUN /bin/sh -c 'wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg' \
 # && /bin/sh -c 'echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null'
  
# Install Gazebo 
RUN apt update \
  && apt install -y --no-install-recommends \
     gz-${GZDIST} \
  && rm -rf /var/lib/apt/lists/* \
  && apt clean -qq
