import jenkins.*
import jenkins.model.*
import hudson.*
import hudson.model.*

job = hudson.model.Hudson.instance.getItem("smx-demo2")
build = job.getLastBuild()
println build
def action = build.getAction(hudson.plugins.claim.ClaimBuildAction.class)
print action.getReason()