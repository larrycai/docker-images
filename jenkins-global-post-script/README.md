# docker-jenkins #

This is the demo on how to use [Global post script jenkins plugin](https://wiki.jenkins-ci.org/display/JENKINS/Global+Post+Script+Plugin)

	docker run -it -p 8080:8080 larrycai/jenkins-global-post-script
	
Login as guest/guest and build the `demo` job, then claim it with reason "my fault"

Then try to see whether we can get the failure reason in groovy.

Now it works from 1.0.12 version.

# Code #

Below is the script `claim.groovy` under `$JENKINS_HOME/global-post-script`, you can post it below to http://localhost:8080/script to run it.

	import jenkins.*
	import jenkins.model.*
	import hudson.*
	import hudson.model.*

	job = hudson.model.Hudson.instance.getItem("demo")
	build = job.getLastBuild()
	println build

	def data = [:]
	def env = build.getEnvironment()

	data["jobTimestamp"] = build.getTimeInMillis()

	data["result"] = build.getResult().toString()
	data["number"] = build.getNumber()
	data["jobName"] = env['JOB_NAME']
	data["builtOn"] = env['NODE_NAME']
	data["url"] = build.getAbsoluteUrl()

	//Convert duration from milisec to minutes
	data["duration"] = build.getDuration() 

	// get test result for Junit/TestNG 
	def testResultAction = build.getTestResultAction() 
	if (testResultAction != null) {
		data["totalCount"] = testResultAction.getTotalCount()
		data["failCount"] = testResultAction.getFailCount()
		data["skipCount"] = testResultAction.getSkipCount()
	} else {
		println "INFO: No junit/testng test result"
	}

	println "INFO: here comes the data"
	println data	
	// doesn't work below, but it works under jenkins console
	def action = build.getAction(hudson.plugins.claim.ClaimBuildAction.class)
	print action.getReason()

	
# Development #

If you want to develop or test the global post script, better to share inside

	$ cd JENKINS_HOME/global-post-script
	$ docker run -it -v $PWD:/opt/jenkins/data/global-post-script -p 8000:8080 larrycai/jenkins-global-post-script

