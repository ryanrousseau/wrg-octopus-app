$ErrorActionPreference = "Continue"

$deployment = $OctopusParameters["Template.Deployment.Name"]

kubectl scale --current-replicas=3 --replicas=1 deployment/$deployment

$LastExitCode = 0
