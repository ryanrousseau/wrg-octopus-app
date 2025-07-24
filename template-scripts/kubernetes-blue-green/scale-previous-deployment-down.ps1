$ErrorActionPreference = "Continue"

$previousDeployment = $OctopusParameters["Octopus.ProcessTemplate.Action[Get active deployment].Output.PreviousDeployment"]

kubectl scale --replicas0 deployment/$previousDeployment

$LastExitCode = 0
