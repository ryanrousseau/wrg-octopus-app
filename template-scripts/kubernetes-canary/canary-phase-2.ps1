$deployment = $OctopusParameters["Template.Deployment.Name"] + "-canary"
$replicas = [int]$OctopusParameters["Template.Deployment.Replicas"]

kubectl scale --current-replicas=$replicas --replicas=$(2 * $replicas) deployment/$deployment
