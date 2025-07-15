# Set varaibles
$clusterNamespace = $OctopusParameters["Project.Cluster.Namespace"]

# Get existing namespaces
Write-Host "Retrieving namespaces ..."
$namespaces = (kubectl get namespaces -o JSON | ConvertFrom-Json)

# Check to see if namespace exists
if ($null -eq ($namespaces.Items | Where-Object {$_.metadata.name -eq $clusterNamespace}))
{
	# Create the namespace
    Write-Host "Namespace $clusetrNamespace doesn't exist, creating ..."
    kubectl create namespace $clusterNamespace
}
else
{
	Write-Host "Namespace $clusterNamespace already exists, moving on ..."
}
