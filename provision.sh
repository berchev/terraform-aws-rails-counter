#!/bin/bash
apt-get update
apt-get install -y docker.io
usermod -aG docker ubuntu
docker run -d --rm --name redis --network="host" ${redis} redis-server --requirepass ${password}
docker run -dit --network="host" --rm  ${counter}
docker run -d -p ${port}:${port} --restart always -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer
