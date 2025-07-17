$deployment = $OctopusParameters["Template.Deployment.Name"] + "-canary"

kubectl scale --current-replicas=1 --replicas=3 deployment/$deployment
