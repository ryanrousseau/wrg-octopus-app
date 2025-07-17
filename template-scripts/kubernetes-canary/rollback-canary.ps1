$ErrorActionPreference = "Continue"

if ("#{Octopus.Action[Detect cancelled canary rollout].Output.Cancelled}" -ieq "true") {

	$deployment = $OctopusParameters["Template.Deployment.Name"]
	$canary = $deployment + "-canary"

	kubectl scale --current-replicas=3 --replicas=1 deployment/$deployment

    kubectl delete deployment $canary
}

$LastExitCode = 0
