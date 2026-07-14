data "octopusdeploy_projects" "lambda_region_tenants" {
  name     = "Amortization Calculator"
  skip     = 0
  take     = 1
  space_id = module.new_cascadia_imports_space.id
}


data "octopusdeploy_projects" "weather_agent_project" {
  name     = "Weather Agent"
  skip     = 0
  take     = 1
  space_id = module.new_cascadia_imports_space.id
}
