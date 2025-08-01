terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeploy/octopusdeploy", version = "1.1.4"
    }
  }
}

provider "octopusdeploy" {
}
