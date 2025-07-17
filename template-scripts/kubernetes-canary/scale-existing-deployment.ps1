$ErrorActionPreference = "Continue"

$deployment = $OctopusParameters["Template.Deployment.Name"]

kubectl scale --current-replicas=1 --replicas=3 deployment/$deployment

$LastExitCode = 0
