terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeploy/octopusdeploy", version = "1.2.0"
    }
  }
}

provider "octopusdeploy" {
}
