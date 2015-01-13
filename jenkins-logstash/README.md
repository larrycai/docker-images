jenkins-logstash
================

This is the demo for [jenkins logstash plugin](https://wiki.jenkins-ci.org/display/JENKINS/Logstash+Plugin)

Mostly it works with [redis-elk](https://github.com/Leorowe/redis-elk) toolkit

    $ docker run -d -p 80:80 -p 3333:3333 -p 9200:9200 -p 6379:6379 --name relk leorowe/redis-elk
	$ docker run -d -p 8080:8080 --link relk:relk larrycai/jenkins-logstash 
	
Then in jenkins http://192.168.59.103:8080 , build the `craft` job, it will send logs to ELK via redis

The log can be shown in kibana GUI jenkins http://192.168.59.103:80

Here IP `192.168.59.103` is boot2docker default IP, you can change IP or other port for your system

`relk` is the hostname known to jenkins, which is set as default in jenkins system setting.

	
	
