$ErrorActionPreference = "Continue"

$deployment = $OctopusParameters["Template.Deployment.Name"]
$replicas = [int]$OctopusParameters["Template.Deployment.Replicas"]

kubectl scale --current-replicas=$(2 * $replicas) --replicas=$replicas deployment/$deployment

$LastExitCode = 0
