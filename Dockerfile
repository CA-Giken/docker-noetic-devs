FROM ghcr.io/ca-giken/rosnoetic-base:main

WORKDIR /root

ENV LIBGL_ALWAYS_SOFTWARE=1
ENV ORGE_RTT_MODE=Copy
RUN apt-get update -q && apt-get install -y \
    g++ automake intltool libgstreamer*-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
# Rovi_industrial setup
#RUN pip install git+https://github.com/UniversalRobots/RTDE_Python_Client_Library.git

COPY ./entrypoint.sh /root/entrypoint.sh
ENTRYPOINT ["/bin/bash", "-c", "/root/entrypoint.sh"]
