FROM refractix/steamcmd

USER steam
WORKDIR /home/steam/steamcmd

COPY mount.cfg /home/steam/init/gmodds/garrysmod/cfg/mount.cfg
COPY start_server.sh /home/steam/bin/start_server.sh

COPY server.cfg /home/steam/init/gmodds/garrysmod/cfg/server.cfg

USER root
RUN chown steam /home/steam/bin/start_server.sh && \
    chmod 755   /home/steam/bin/start_server.sh

EXPOSE 27015/udp
EXPOSE 27015/tcp

USER steam
WORKDIR /home/steam/
ENTRYPOINT ["/bin/bash", "/home/steam/bin/start_server.sh"]
