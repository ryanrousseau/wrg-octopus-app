terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeploy/octopusdeploy"
    }
  }
}

resource "octopusdeploy_git_credential" "git_credential" {
  description                  = var.description
  name                         = var.name
  password                     = var.password
  space_id                     = var.space_id
  type                         = var.type
  username                     = var.username
}
