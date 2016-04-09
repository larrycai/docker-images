#!/bin/bash

export DOCKER_HOST=unix://docker.sock
# docker run -d -p 2222:22 larrycai/jenkins-slave-ubuntu
exec java -jar /opt/jenkins/jenkins.war
