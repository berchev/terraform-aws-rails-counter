#!/bin/bash

# Make sure ec2 image is up and running before start installing software
#retry=10
#i=0
#while [ $${i} -lt $${retry} ]; do
#       curl -sL http://google.com &>/dev/null 
#       [ $? -eq 0 ] && break
#       let i++
#       sleep 60
#done

#unset retry
#unset i


apt-get update
apt-get install -y docker.io
usermod -aG docker ubuntu
docker run -d --rm --name redis --network="host" ${redis} redis-server --requirepass ${password}
docker run -dit --network="host" --rm  ${counter}
docker run -d -p ${port}:${port} --restart always -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer
