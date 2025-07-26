resource "octopusdeploy_lifecycle" "standard_lifecycle" {
  description = "Standard lifecycle"
  name        = var.lifecycle_name
  space_id    = var.space_id

  release_retention_policy {
    quantity_to_keep    = 30
    should_keep_forever = false
    unit                = "Days"
  }

  tentacle_retention_policy {
    quantity_to_keep    = 3
    should_keep_forever = false
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

    release_retention_policy {
      quantity_to_keep    = 60
      should_keep_forever = false
      unit                = "Days"
    }

    tentacle_retention_policy {
      quantity_to_keep    = 3
      should_keep_forever = false
      unit                = "Items"
    }
  }

  phase {
    automatic_deployment_targets = [module.prod_env.id]
    is_priority_phase = true
    optional_deployment_targets  = []
    name                         = module.prod_env.name

    release_retention_policy {
      quantity_to_keep    = 180
      should_keep_forever = false
      unit                = "Days"
    }

    tentacle_retention_policy {
      quantity_to_keep    = 3
      should_keep_forever = false
      unit                = "Items"
    }
  }
}
