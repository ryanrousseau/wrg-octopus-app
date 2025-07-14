module "administration_space" {
  source = "../modules/space"

  providers = {
    octopusdeploy = octopusdeploy
  }

  name        = "Administration"
  description = "Space for admin projects and activities"
  space_managers_teams  = [module.platform_engineering_team.id]
  is_task_queue_stopped = false
}

module "administation_space_administration_environment" {
  source = "../modules/environment"

  providers = {
    octopusdeploy = octopusdeploy
  }

  space_id   = module.administration_space.id
  name       = "Administration"
  sort_order = 0
}

module "administation_space_docker_registry" {
  source = "../modules/feeds/docker_container_registry"

  name     = "Docker Hub"
  space_id = module.administration_space.id
}

module "administation_space_helm_feed" {
  source = "../modules/feeds/helm_feed"

  name     = "Helm - Stable"
  space_id = module.administration_space.id
}
