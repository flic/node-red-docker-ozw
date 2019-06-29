FROM nodered/node-red-docker:latest
USER root

WORKDIR /usr/src/node-red

RUN mkdir -pv /usr/src/
RUN git clone https://github.com/OpenZWave/open-zwave.git /usr/src/open-zwave
RUN cd /usr/src/open-zwave \
    && make \
    && make install
RUN ldconfig /usr/local/lib64
RUN cd /usr/src/node-red \
    && npm install openzwave-shared

USER node-red
RUN cd /data \
    && npm install node-red-contrib-openzwave
