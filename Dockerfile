FROM nodered/node-red-docker
USER root
RUN apt-get update \
    && apt-get install -y openzwave \
    && apt-get install -y libopenzwave1.5 \
    && apt-get install -y libopenzwave1.5-dev
USER node-red
RUN cd /data \
    && npm install node-red-contrib-openzwave
