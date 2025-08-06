module "new_cascadia_imports_space" {
  source = "../modules/space"

  providers = {
    octopusdeploy = octopusdeploy
  }

  name        = "New Cascadia Imports"
  description = "Space for the NCI subsidiary"
  space_managers_teams  = [module.platform_engineering_team.id]
  is_task_queue_stopped = false
}

module "new_cascadia_imports_space_dev_test_prod" {
  source = "../modules/preset_envs/dev_test_prod"

  providers = {
    octopusdeploy = octopusdeploy
  }

  space_id = module.new_cascadia_imports_space.id
}

resource "octopusdeploy_lifecycle" "hotfix_lifecycle" {
  description = "Hotfix lifecycle"
  name        = "Hotfix"
  space_id    = module.new_cascadia_imports_space.id

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
    automatic_deployment_targets = []
    is_optional_phase            = true
    is_priority_phase            = true
    optional_deployment_targets  = [module.new_cascadia_imports_space_dev_test_prod.test_env_id]
    name                         = module.new_cascadia_imports_space_dev_test_prod.test_env_name
  }

  phase {
    automatic_deployment_targets = []
    is_priority_phase            = true
    optional_deployment_targets  = [module.new_cascadia_imports_space_dev_test_prod.prod_env_id]
    name                         = module.new_cascadia_imports_space_dev_test_prod.prod_env_name

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

resource "octopusdeploy_lifecycle" "development_lifecycle" {
  description = "Development lifecycle"
  name        = "Development"
  space_id    = module.new_cascadia_imports_space.id

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
    automatic_deployment_targets = [module.new_cascadia_imports_space_dev_test_prod.dev_env_id]
    optional_deployment_targets  = []
    name                         = module.new_cascadia_imports_space_dev_test_prod.dev_env_name
  }
}

resource "octopusdeploy_lifecycle" "test_lifecycle" {
  description = "Test lifecycle"
  name        = "Test"
  space_id    = module.new_cascadia_imports_space.id

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
    automatic_deployment_targets = [module.new_cascadia_imports_space_dev_test_prod.test_env_id]
    optional_deployment_targets  = []
    name                         = module.new_cascadia_imports_space_dev_test_prod.test_env_name
  }
}

resource "octopusdeploy_lifecycle" "production_lifecycle" {
  description = "Production lifecycle"
  name        = "Production"
  space_id    = module.new_cascadia_imports_space.id

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
    automatic_deployment_targets = [module.new_cascadia_imports_space_dev_test_prod.prod_env_id]
    optional_deployment_targets  = []
    name                         = module.new_cascadia_imports_space_dev_test_prod.prod_env_name
  }
}

module "new_cascadia_imports_space_dev_team" {
  source = "../modules/team"

  providers = {
    octopusdeploy = octopusdeploy
  }

  name        = "Dev Team"
  description = "Dev team for New cascadia Imports"
  space_id    = module.new_cascadia_imports_space.id
  #external_security_groups = [
  #    {
  #        id = "externalGroupId"
  #        display_name = "External Group Name"
  #        display_id_and_name = true
  #    }
  #]
  users = [] #[data.octopusdeploy_users.ryan_rousseau.users[0].id]
}

resource "octopusdeploy_scoped_user_role" "new_cascadia_imports_space_dev_team_project_contributor" {
  space_id        = module.new_cascadia_imports_space.id
  team_id         = module.new_cascadia_imports_space_dev_team.id
  user_role_id    = "userroles-projectcontributor"
  environment_ids = []
  # project_group_ids = []
  # project_ids = []
  # tenant_ids = []
}

resource "octopusdeploy_scoped_user_role" "new_cascadia_imports_space_dev_team_deployment_creator" {
  space_id        = module.new_cascadia_imports_space.id
  team_id         = module.new_cascadia_imports_space_dev_team.id
  user_role_id    = "userroles-deploymentcreator"
  environment_ids = [module.new_cascadia_imports_space_dev_test_prod.dev_env_id]
}

module "new_cascadia_imports_space_qa_team" {
  source = "../modules/team"

  providers = {
    octopusdeploy = octopusdeploy
  }

  name        = "QA Team"
  description = "QA team for Managed Space 1"
  space_id    = module.new_cascadia_imports_space.id
  #external_security_groups = [
  #    {
  #        id = "externalGroupId"
  #        display_name = "External Group Name"
  #        display_id_and_name = true
  #    }
  #]
  users = [] #[data.octopusdeploy_users.ryan_rousseau.users[0].id]
}

resource "octopusdeploy_scoped_user_role" "new_cascadia_imports_space_qa_team_deployment_creator" {
  space_id        = module.new_cascadia_imports_space.id
  team_id         = module.new_cascadia_imports_space_qa_team.id
  user_role_id    = "userroles-deploymentcreator"
  environment_ids = [module.new_cascadia_imports_space_dev_test_prod.test_env_id]
}

module "new_cascadia_imports_space_docker_registry" {
  source   = "../modules/feeds/docker_container_registry"

  name     = "Docker Hub"
  space_id = module.new_cascadia_imports_space.id
  username = "octopussolutionsengineering"
  password = var.docker_hub_password
}

module "new_cascadia_imports_space_sales_solutions" {
  source = "../modules/account/aws"

  name                              = "Sales - Solutions"
  access_key                        = var.sales_solutions_access_key
  secret_key                        = var.sales_solutions_secret_key
  tenanted_deployment_participation = "TenantedOrUntenanted"
  tenants                           = [
    module.new_cascadia_imports_space_sa_east_1.id,
    module.new_cascadia_imports_space_us_east_1.id,
    module.new_cascadia_imports_space_us_west_2.id
  ]
  space_id                          = module.new_cascadia_imports_space.id
}

module "new_cascadia_imports_space_ecr" {
  source   = "../modules/feeds/aws_ecr"

  name       = "Sales - Solutions - ECR"
  access_key = var.sales_solutions_access_key
  region     = "us-west-2"
  secret_key = var.sales_solutions_secret_key
  space_id = module.new_cascadia_imports_space.id
}

module "new_cascadia_imports_space_helm_feed" {
  source   = "../modules/feeds/helm_feed"

  name     = "Helm - Stable"
  space_id = module.new_cascadia_imports_space.id
}

module "new_cascadia_imports_space_azure_feed" {
  source   = "../modules/feeds/nuget_feed"

  feed_uri = "https://pkgs.dev.azure.com/octopussamples/_packaging/octopus-demo-artifacts/nuget/v3/index.json"
  name     = "Azure Artifacts"
  username = "azure"
  password = var.azure_feed_pat
  space_id = module.new_cascadia_imports_space.id
}

module "new_cascadia_imports_space_templates_project_group" {
  source   = "../modules/project_group"

  name     = "Templates"
  space_id = module.new_cascadia_imports_space.id
}

module "new_cascadia_imports_space_kubernetes_project_group" {
  source   = "../modules/project_group"

  name     = "Kubernetes"
  space_id = module.new_cascadia_imports_space.id
}

module "new_cascadia_imports_space_lambda_project_group" {
  source   = "../modules/project_group"

  name     = "Lambda"
  space_id = module.new_cascadia_imports_space.id
}

module "new_cascadia_imports_space_machines_project_group" {
  source   = "../modules/project_group"

  name     = "Machines"
  space_id = module.new_cascadia_imports_space.id
}

module "new_cascadia_imports_space_octopub_project_group" {
  source   = "../modules/project_group"

  name     = "Octopub"
  space_id = module.new_cascadia_imports_space.id
}

module "new_cascadia_imports_space_temp_project_group" {
  source   = "../modules/project_group"

  name     = "Temp"
  space_id = module.new_cascadia_imports_space.id
}

module "new_cascadia_imports_space_release_ring_tag_set" {
  source   = "../modules/tag_set"

  name     = "Release Ring"
  space_id = module.new_cascadia_imports_space.id
}

module "new_cascadia_imports_space_release_ring_alpha" {
  source   = "../modules/tag"

  color            = "#0d80d8"
  name             = "Alpha"
  sort_order       = 0
  tag_set_id       = module.new_cascadia_imports_space_release_ring_tag_set.id
  tag_set_space_id = module.new_cascadia_imports_space.id
}

module "new_cascadia_imports_space_release_ring_beta" {
  source   = "../modules/tag"

  color            = "#0d80d8"
  name             = "Beta"
  sort_order       = 1
  tag_set_id       = module.new_cascadia_imports_space_release_ring_tag_set.id
  tag_set_space_id = module.new_cascadia_imports_space.id
}

module "new_cascadia_imports_space_release_ring_stable" {
  source   = "../modules/tag"

  color            = "#0d80d8"
  name             = "Stable"
  sort_order       = 2
  tag_set_id       = module.new_cascadia_imports_space_release_ring_tag_set.id
  tag_set_space_id = module.new_cascadia_imports_space.id
}

module "new_cascadia_imports_space_us_west_2" {
  source   = "../modules/tenant"

  name     = "US West 2"
  space_id = module.new_cascadia_imports_space.id
}

module "new_cascadia_imports_space_us_east_1" {
  source   = "../modules/tenant"

  name     = "US East 1"
  space_id = module.new_cascadia_imports_space.id
}

module "new_cascadia_imports_space_sa_east_1" {
  source   = "../modules/tenant"

  name     = "South America East 1"
  space_id = module.new_cascadia_imports_space.id
}

module "new_cascadia_imports_space_lambda_us_west_2" {
  source   = "../modules/tenant_project"

  project_id      = data.octopusdeploy_projects.lambda_region_tenants.projects[0].id
  tenant_id       = module.new_cascadia_imports_space_us_west_2.id
  environment_ids = [module.new_cascadia_imports_space_dev_test_prod.dev_env_id, module.new_cascadia_imports_space_dev_test_prod.test_env_id, module.new_cascadia_imports_space_dev_test_prod.prod_env_id]
  space_id        = module.new_cascadia_imports_space.id
}

module "new_cascadia_imports_space_lambda_us_east_1" {
  source   = "../modules/tenant_project"

  project_id      = data.octopusdeploy_projects.lambda_region_tenants.projects[0].id
  tenant_id       = module.new_cascadia_imports_space_us_east_1.id
  environment_ids = [module.new_cascadia_imports_space_dev_test_prod.test_env_id, module.new_cascadia_imports_space_dev_test_prod.prod_env_id]
  space_id        = module.new_cascadia_imports_space.id
}

module "new_cascadia_imports_space_lambda_sa_east_1" {
  source   = "../modules/tenant_project"

  project_id      = data.octopusdeploy_projects.lambda_region_tenants.projects[0].id
  tenant_id       = module.new_cascadia_imports_space_sa_east_1.id
  environment_ids = [module.new_cascadia_imports_space_dev_test_prod.prod_env_id]
  space_id        = module.new_cascadia_imports_space.id
}
