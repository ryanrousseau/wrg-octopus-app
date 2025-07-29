terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeploy/octopusdeploy"
    }
  }
}

resource "octopusdeploy_aws_account" "account" {
  access_key = var.access_key
  name = var.name
  secret_key = var.secret_key
  space_id = var.space_id
  description = var.description
  environments = var.environments
  tenant_tags = var.tenant_tags
  tenanted_deployment_participation = var.tenanted_deployment_participation
  tenants = var.tenants
}