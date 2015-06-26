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

def action = build.getAction(hudson.plugins.claim.ClaimBuildAction.class)
println action.getReason()

println "Get time in queue, not solved yet"
println build.getStartTimeInMillis()
println build.getTimeInMillis()