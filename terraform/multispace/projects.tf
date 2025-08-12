data "octopusdeploy_projects" "lambda_region_tenants" {
  name     = "Loan Pilot - Amortization Calculator"
  skip     = 0
  take     = 1
  space_id = module.new_cascadia_imports_space.id
}
