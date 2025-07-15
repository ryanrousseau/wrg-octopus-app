$ErrorActionPreference = "Continue"

$deployment = $OctopusParameters["Project.Deployment.Name"]

kubectl scale --current-replicas=3 --replicas=1 deployment/$deployment

$LastExitCode = 0
