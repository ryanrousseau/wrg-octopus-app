terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeploy/octopusdeploy", version = "0.39.0"
    }
  }
}

provider "octopusdeploy" {
}
