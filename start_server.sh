#!/bin/sh

CFG_FILES="gmodds/garrysmod/cfg/mount.cfg gmodds/garrysmod/cfg/server.cfg"
DATA_BASE="/home/steam/data"
INIT_BASE="/home/steam/init"

init(){
  echo "init game data..."
  echo "install gmodds..."
  /home/steam/steamcmd/steamcmd.sh +force_install_dir "/home/steam/data/gmodds" +login anonymous +app_update 4020 validate +quit
  echo "install Team Fortress 2 data..."
  /home/steam/steamcmd/steamcmd.sh +force_install_dir "/home/steam/data/content/tf2" +login anonymous +app_update 232250 validate +quit
  echo "install CSS data..."
  /home/steam/steamcmd/steamcmd.sh +force_install_dir "/home/steam/data/content/css" +login anonymous +app_update 232330 validate +quit

  echo "downloads done!"
  echo "init cfg files if not already existing..."
  for file in ${CFG_FILES}; do
    #if [[ ! -f ${INIT_BASE}/${file} ]]; then
      cp -r ${INIT_BASE}/${file} ${DATA_BASE}/${file}
    #fi
  done
  echo "init done!"
}

start_server(){
  echo "starting server..."
  /home/steam/data/gmodds/srcds_run -console -game garrysmod +maxplayers 16 +map gm_construct +gamemode terrortown +host_workshop_collection ${WORKSHOP_COLLECTION_ID} -authkey ${AUTH_KEY}
  echo "stopped server... exiting!"
}

echo "starting start_server.sh..."

case ${1} in
    "init" )
      init
      ;;
    "start" )
      start_server
      ;;
    * )
      init
      start_server
      ;;
esac
