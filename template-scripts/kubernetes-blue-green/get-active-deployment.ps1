$serviceName = $OctopusParameters["Template.Service.Name"]

$deploymentId = $(kubectl get service $serviceName -o json | jq -r '.spec.selector.deployment')

Write-Verbose "Found previous deployment: $deploymentId"

Set-OctopusVariable -name "PreviousDeployment" -value $deployment