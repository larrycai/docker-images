#!/bin/bash

cat << END

This is the demo docker container to launch 2 tomcat & 1 haproxy automatically

Please run

    docker run -v /var/run/docker.sock:/docker.sock larrycai/craft demo
	
BTW: Do you like name craft ? 

END