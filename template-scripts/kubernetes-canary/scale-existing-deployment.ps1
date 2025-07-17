$ErrorActionPreference = "Continue"

$deployment = $OctopusParameters["Template.Deployment.Name"]
$replicas = [int]$OctopusParameters["Template.Deployment.Replicas"]

kubectl scale --current-replicas=$replicas --replicas=$(2 * $replicas) deployment/$deployment

$LastExitCode = 0
