# Must build the noetic base image first
FROM dockwater:melodic

# LCM 
RUN apt update \
 && apt install -y --no-install-recommends \
 build-essential \
 libglib2.0-dev \
 cmake \
 openjdk-8-jdk \
 python-all-dev \
 unzip \
 zip \
&& apt clean
	
RUN mkdir -p /tmp/lcm \
    && curl -L https://github.com/lcm-proj/lcm/releases/download/v1.4.0/lcm-1.4.0.zip --output /tmp/lcm/lcm-1.4.0.zip \
    && cd /tmp/lcm \
    && unzip  lcm-1.4.0.zip \
    && cd /tmp/lcm/lcm-1.4.0 \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make \
    && sudo make install \
    && cd /tmp/lcm/lcm-1.4.0/lcm-python \
    && sudo python setup.py install

