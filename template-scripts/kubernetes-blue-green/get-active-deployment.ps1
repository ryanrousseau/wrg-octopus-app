$serviceName = $OctopusParameters["Template.Service.Name"]

$deploymentId = $(kubectl get service $serviceName -o json | jq -r '.spec.selector.deployment')

$foundActiveDeployment = -not ($deploymentId -eq $null)

if ($foundActiveDeployment) {
    Write-Verbose "Found previous deployment: $deploymentId"
    Set-OctopusVariable -name "PreviousDeployment" -value $deploymentId
} else {
    Write-Warning "Did not find an existing deployment"
}

Set-OctopusVariable -name "FoundActiveDeployment" -value $foundActiveDeployment
