export PIHOLE_COMPOSE_FILE="pi-hole/docker-compose.yml"

docker compose -f $PIHOLE_COMPOSE_FILE pull

docker compose -f $PIHOLE_COMPOSE_FILE down --remove-orphans

docker compose -f $PIHOLE_COMPOSE_FILE up --force-recreate --build --remove-orphans -d

docker system prune -f
