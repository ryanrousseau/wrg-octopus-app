terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeploy/octopusdeploy"
    }
  }
}

resource "octopusdeploy_project_group" "project_group" {
  name         = var.name
  description  = var.description
  space_id     = var.space_id
}
