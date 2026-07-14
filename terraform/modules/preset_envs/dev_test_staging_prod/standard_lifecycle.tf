resource "octopusdeploy_lifecycle" "standard_lifecycle" {
  description = "Standard lifecycle"
  name        = var.lifecycle_name
  space_id    = var.space_id

  release_retention_with_strategy {
    strategy = "Count"
    quantity_to_keep    = 30
    unit                = "Days"
  }

  tentacle_retention_with_strategy {
    strategy = "Count"
    quantity_to_keep    = 3
    unit                = "Items"
  }

  phase {
    automatic_deployment_targets = []
    optional_deployment_targets  = [module.dev_env.id]
    name                         = module.dev_env.name
  }

  phase {
    automatic_deployment_targets = []
    optional_deployment_targets  = [module.test_env.id]
    name                         = module.test_env.name
  }

  phase {
    automatic_deployment_targets = []
    optional_deployment_targets  = [module.staging_env.id]
    name                         = module.staging_env.name
  }

  phase {
    automatic_deployment_targets = []
    optional_deployment_targets  = [module.prod_env.id]
    name                         = module.prod_env.name
  }
}
