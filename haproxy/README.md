## Introduction ##

This is the demo package for training purpose, it is based on https://github.com/dockerfile/haproxy 

    $ docker run -d --name web1 larrycai/tomcat
    $ docker run -d --name web2 larrycai/tomcat
    $ docker run -d -P --link web1:back1 --link web2:back2 larrycai/haproxy

Usage:

* Port 80  : connect to backend 8080
* Port 8080: haproxy stats


