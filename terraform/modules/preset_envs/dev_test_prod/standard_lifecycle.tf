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
    automatic_deployment_targets = [module.dev_env.id]
    optional_deployment_targets  = []
    name                         = module.dev_env.name
  }

  phase {
    automatic_deployment_targets = [module.test_env.id]
    optional_deployment_targets  = []
    name                         = module.test_env.name
  }

  phase {
    automatic_deployment_targets = [module.prod_env.id]
    is_priority_phase = true
    optional_deployment_targets  = []
    name                         = module.prod_env.name
  }
}
