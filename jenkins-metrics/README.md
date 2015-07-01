# docker-jenkins #

This is the demo on how to get wait in queue time using [metrics jenkins plugin](https://wiki.jenkins-ci.org/display/JENKINS/Metrics+Plugin)

see stackoverflow question to understand more : http://stackoverflow.com/questions/28735049/how-can-i-know-how-long-a-jenkins-job-has-been-in-the-wait-queue-after-the-job-i 

	docker run -it -p 8080:8080 larrycai/jenkins-metrics
	
Then you can get time in queue from http://localhost:8080/job/demo/1/api/json?pretty=true&depth=2 . `queuingDurationMillis` is the data I wanted.

	"actions" : [
	{
	  "queuingDurationMillis" : 33,
	  "totalDurationMillis" : 3067
	}
	],
	
Also we can get this data in groovy via internal data, check below code in Jenkins Script console http://localhost:8080/script

	job = hudson.model.Hudson.instance.getItem("demo")
	build = job.getLastBuild()
	action = build.getAction(jenkins.metrics.impl.TimeInQueueAction.class)
	println action.getQueuingDurationMillis()

Check more in https://github.com/jenkinsci/metrics-plugin/blob/master/src/main/java/jenkins/metrics/impl/TimeInQueueAction.java 

