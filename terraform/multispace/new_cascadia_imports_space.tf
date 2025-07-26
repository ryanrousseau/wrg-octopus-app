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
