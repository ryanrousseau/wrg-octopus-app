output "dev_env_id" {
  value = module.dev_env.id
}

output "dev_env_name" {
  value = module.dev_env.name
}

output "test_env_id" {
  value = module.test_env.id
}

output "test_env_name" {
  value = module.test_env.name
}

output "prod_env_id" {
  value = module.prod_env.id
}

output "prod_env_name" {
  value = module.prod_env.name
}

output "standard_lifecycle_id" {
  value = octopusdeploy_lifecycle.standard_lifecycle.id
}
