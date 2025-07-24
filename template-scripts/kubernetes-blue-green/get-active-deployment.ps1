$deploymentName = $OctopusParameters["Template.Deployment.Name"]
$serviceName = $OctopusParameters["Template.Service.Name"]

$deploymentId = $(kubectl get service $serviceName -o json | jq -r '.spec.selector.deployment')

$foundActiveDeployment = -not ($deploymentId -eq $null)

if ($foundActiveDeployment) {
    $deployment = $deploymentName + "-" + $deploymentId.ToLower()
    Write-Verbose "Found previous deployment: $deployment"
    Set-OctopusVariable -name "PreviousDeployment" -value $deployment
} else {
    Write-Warning "Did not find an existing deployment"
}

Set-OctopusVariable -name "FoundActiveDeployment" -value $foundActiveDeployment
