FROM ghcr.io/ca-giken/rosnoetic-base:main

# Install VT common
RUN apt-get update -q && apt-get install -y \
    netcat \
    wmctrl

# Install VT optionals
#RUN apt update
#RUN apt install -y ros-noetic-jsk-visualization
# Rovi_industrial setup
#RUN pip install git+https://github.com/UniversalRobots/RTDE_Python_Client_Library.git

# Create VT workspace
RUN mkdir -p /root/catkin_ws/src
RUN mkdir /ssd

# Install Ensenso SDK
RUN apt-get update -q && apt-get install -y \
    libusb-1.0-0-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean
COPY ensenso-sdk-4.*.deb /tmp/
RUN apt-get update -q && \
    ls -1 /tmp/ensenso-sdk-4.*.deb | head -n 1 | xargs apt-get install -y && \
    rm /tmp/ensenso-sdk-4.*.deb \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# SDKのパスを環境変数で設定
ENV ENSENSO_INSTALL=/opt/ensenso

# Set the entrypoint
COPY ./entrypoint.sh /root/entrypoint.sh
ENTRYPOINT ["/bin/bash", "-c", "/root/entrypoint.sh"]
