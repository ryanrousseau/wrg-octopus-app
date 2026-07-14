terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeploy/octopusdeploy", version = "1.18.0"
    }
  }
}

provider "octopusdeploy" {
}
