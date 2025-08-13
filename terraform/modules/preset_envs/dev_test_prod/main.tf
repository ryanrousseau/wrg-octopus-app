terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeploy/octopusdeploy"
    }
  }
}

module "dev_env" {
  source = "../../environment"

  providers = {
    octopusdeploy = octopusdeploy
  }

  allow_dynamic_infrastructure = true
  name       = var.development_name
  sort_order = 1
  space_id   = var.space_id
}

module "test_env" {
  source = "../../environment"

  providers = {
    octopusdeploy = octopusdeploy
  }

  allow_dynamic_infrastructure = true
  name       = var.test_name
  sort_order = 2
  space_id   = var.space_id
}

module "prod_env" {
  source = "../../environment"

  providers = {
    octopusdeploy = octopusdeploy
  }

  allow_dynamic_infrastructure = true
  name       = var.production_name
  sort_order = 3
  space_id   = var.space_id
}
