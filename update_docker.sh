export TOOLS_COMPOSE_FILE="sys_tools/docker-compose.yml"
export HA_COMPOSE_FILE="home_assistant/docker-compose.yml"
export PLEX_COMPOSE_FILE="plex/docker-compose.yml"
export EVCC_COMPOSE_FILE="evcc/docker-compose.yml"

docker compose -f $TOOLS_COMPOSE_FILE down --remove-orphans
docker compose -f $HA_COMPOSE_FILE down --remove-orphans
docker compose -f $PLEX_COMPOSE_FILE down --remove-orphans

docker system prune -f

docker compose -f $TOOLS_COMPOSE_FILE pull
docker compose -f $HA_COMPOSE_FILE pull
docker compose -f $PLEX_COMPOSE_FILE pull

docker compose -f $TOOLS_COMPOSE_FILE up --force-recreate --build --remove-orphans -d
docker compose -f $HA_COMPOSE_FILE up --force-recreate --build --remove-orphans -d
docker compose -f $PLEX_COMPOSE_FILE up --force-recreate --build --remove-orphans -d

#evcc extra as it's not HA related really...yet...
docker compose -f $EVCC_COMPOSE_FILE down --remove-orphans
docker system prune -f
docker compose -f $EVCC_COMPOSE_FILE pull
docker compose -f $EVCC_COMPOSE_FILE up --force-recreate --build --remove-orphans -d

# pihole is done at the end as it's our DNS server...
export PIHOLE_COMPOSE_FILE="pi-hole/docker-compose.yml"
docker compose -f $PIHOLE_COMPOSE_FILE down --remove-orphans
docker system prune -f
docker compose -f $PIHOLE_COMPOSE_FILE pull
docker compose -f $PIHOLE_COMPOSE_FILE up --force-recreate --build --remove-orphans -d

