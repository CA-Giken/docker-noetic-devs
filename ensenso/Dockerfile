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
COPY ensenso-sdk-4.*.deb /tmp/
RUN cd /tmp && dpkg -i ensenso-sdk-4.*.deb

# SDKのパスを環境変数で設定
ENV ENSENSO_INSTALL=/opt/ensenso

# Set the entrypoint
COPY ./entrypoint.sh /root/entrypoint.sh
ENTRYPOINT ["/bin/bash", "-c", "/root/entrypoint.sh"]
