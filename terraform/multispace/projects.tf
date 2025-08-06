data "octopusdeploy_projects" "lambda_region_tenants" {
  name     = "Lambda - Region Tenants"
  skip     = 0
  take     = 1
  space_id = module.new_cascadia_imports_space.id
}
