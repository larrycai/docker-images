#!/bin/bash

DOCKER_SOCK="/docker.sock"
# check file exists
if [[ -e "$DOCKER_SOCK" ]]; then
  echo "It is launching ... "
  echo "  may take several minutes first time due to pulling from remotely"
else
  echo "can't find $DOCKER_SOCK, please run"
  echo "docker run -v /var/run/docker.sock:$DOCKER_SOCK larrycai/craft demo"
fi

docker run -d --name web1 larrycai/tomcat
docker run -d --name web2 larrycai/tomcat
docker run -d -P --link web1:back1 --name haproxy --link web2:back2 larrycai/haproxy

STAT_URL=$(docker port haproxy 8080)
WEB_URL=$(docker port haproxy 80)

# remove 0.0.0.0 infront
STAT_PORT=${STAT_URL/0.0.0.0:/}
WEB_PORT=${WEB_URL/0.0.0.0:/}

echo "You can access to following web service now, (default ip for boot2docker is 192.168.59.103)"
echo "  change 192.168.59.103 to your docker host IP address if not."
echo ""
echo " - HAproxy stats web : http://192.168.59.103:$STAT_PORT/"
echo " - Tomcat via Haproxy: http://192.168.59.103:$WEB_PORT/"
echo ""
echo "Type following command to remove those containers" 
echo ""
echo "  docker ps  | grep haproxy | awk '{print \$1}' | xargs docker rm -f"   
echo ""
echo "Thanks for using, feedback to larry.caiyu(at)gmail.com"