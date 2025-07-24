$ErrorActionPreference = "Continue"

$previousDeployment = $OctopusParameters["Octopus.ProcessTemplate.Action[Get active deployment].Output.PreviousDeployment"]

Write-Highlight "Scaling down $previousDeployment"

kubectl scale --replicas 0 deployment/$previousDeployment

$LastExitCode = 0
