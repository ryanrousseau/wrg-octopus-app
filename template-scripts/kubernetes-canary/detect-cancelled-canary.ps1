$ErrorActionPreference = "Continue"

if ("#{Octopus.Action[Approve canary phase 1].Output.Manual.Approved}" -ieq "false" -or
	"#{Octopus.Action[Approve canary phase 2].Output.Manual.Approved}" -ieq "false" -or
	"#{Octopus.Action[Approve canary phase 3].Output.Manual.Approved}" -ieq "false") {
	Set-OctopusVariable -name "Cancelled" -value "True"
    Write-Highlight "Deployment was cancelled by a manual intervention."
} else {
	Set-OctopusVariable -name "Cancelled" -value "False"
    Write-Highlight "Deployment completed successfully, so no rollback required."
}

$LastExitCode = 0
