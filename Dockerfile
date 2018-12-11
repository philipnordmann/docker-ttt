FROM refractix/steamcmd

USER steam
WORKDIR /home/steam/steamcmd
RUN mkdir -p /home/steam/content/css
RUN mkdir -p /home/steam/content/tf2
RUN ./steamcmd.sh +force_install_dir "/home/steam/gmodds" +login anonymous +app_update 4020 validate +quit
RUN ./steamcmd.sh +force_install_dir "/home/steam/content/tf2" +login anonymous +app_update 232250 validate +quit
RUN ./steamcmd.sh +force_install_dir "/home/steam/content/css" +login anonymous +app_update 232330 validate +quit

COPY mount.cfg /home/steam/gmodds/garrysmod/cfg/mount.cfg
COPY create_server_cfg.sh /home/steam/create_server_cfg.sh
COPY start_server.sh /home/steam/start_server.sh

USER root
RUN chown steam /home/steam/create_server_cfg.sh /home/steam/start_server.sh && \
    chmod 755 /home/steam/create_server_cfg.sh /home/steam/start_server.sh

USER steam
WORKDIR /home/steam/
CMD [ "sh", "-c", "./start_server.sh" ]
