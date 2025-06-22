FROM ghcr.io/ca-giken/rosnoetic-base:main

# Install VT common
RUN apt-get update -q && apt-get install -y \
    netcat \
    wmctrl

# Install VT optionals
RUN apt update
RUN apt install -y ros-noetic-jsk-visualization
# Rovi_industrial setup
RUN pip install git+https://github.com/UniversalRobots/RTDE_Python_Client_Library.git

# Create VT workspace
RUN mkdir -p /root/catkin_ws/src
RUN mkdir /ssd

# Install ROVI SDK
RUN apt-get update -q && apt-get install -y \
    intltool \
    libgstreamer*-dev \
    libusb-1.0-0-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN wget http://ftp.gnome.org/pub/GNOME/sources/aravis/0.6/aravis-0.6.0.tar.xz
RUN tar -xvf aravis-0.6.0.tar.xz
RUN cd aravis-0.6.0 && ./configure && make && make install
#RUN if ! grep /usr/local/lib /etc/ld.so.conf ; then echo "/usr/local/lib" | tee -a /etc/ld.so.conf && ldconfig ; fi
RUN echo "/usr/local/lib" | tee -a /etc/ld.so.conf && ldconfig

# Set the entrypoint
COPY ./entrypoint.sh /root/entrypoint.sh
ENTRYPOINT ["/bin/bash", "-c", "/root/entrypoint.sh"]
