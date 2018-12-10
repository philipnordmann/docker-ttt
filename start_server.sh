#!/bin/sh
./create_server_cfg.sh /home/steam/gmodds/garrysmod/cfg/server.cfg
./gmodds/srcds_run -console -game garrysmod +maxplayers 16 +map gm_construct +gamemode terrortown +host_workshop_collection ${WORKSHOP_COLLECTION_ID} -authkey ${AUTH_KEY}
