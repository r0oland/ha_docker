export TOOLS_COMPOSE_FILE="sys_tools/docker-compose.yml"
export HA_COMPOSE_FILE="home_assistant/docker-compose.yml"
export PLEX_COMPOSE_FILE="plex/docker-compose.yml"

docker compose -f $TOOLS_COMPOSE_FILE down --remove-orphans
docker compose -f $HA_COMPOSE_FILE down --remove-orphans
docker compose -f $PLEX_COMPOSE_FILE down --remove-orphans