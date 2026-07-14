terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeploy/octopusdeploy", version = "1.7.0"
    }
  }
}

provider "octopusdeploy" {
}
