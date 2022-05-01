# Docker Compose Infos / Commands

## start named systools

docker-compose -p "sys_tools" -f "docker/docker-compose-system-tools.yml" up --force-recreate --build --remove-orphans -d

## start home assistant container with default names

docker-compose -f "docker/docker-compose-homeassi.yml" up --force-recreate --build --remove-orphans -d
docker-compose -f "docker/home_assistant/docker-compose-homeassi.yml" up --force-recreate --build --remove-orphans -d
docker-compose -f "docker/docker-compose-homeassi.yml" down

## Update, then restart

docker-compose pull
docker-compose up --detach --build

## Shutdown, update and restart all stacks / container

just run "./update_docker.sh" in the docker folder

## Cleanup

docker system prune

