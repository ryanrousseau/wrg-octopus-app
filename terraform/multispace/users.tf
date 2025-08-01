data "octopusdeploy_users" "octopus_config_service_account" {
  filter = var.octopus_service_account
  take   = 1
}

data "octopusdeploy_users" "ryan_rousseau" {
  filter = "Ryan Rousseau"
  take   = 1
}

data "octopusdeploy_users" "mark_harrison" {
  filter = "Mark Harrison"
  take   = 1
}

data "octopusdeploy_users" "grace_rehn" {
  filter = "Grace Rehn"
  take   = 1
}

data "octopusdeploy_users" "ava" {
  filter = "Ava Kamara"
  take   = 1
}

data "octopusdeploy_users" "dillon" {
  filter = "Dillon Taylor"
  take   = 1
}

data "octopusdeploy_users" "ian" {
  filter = "Ian James"
  take   = 1
}

data "octopusdeploy_users" "ping" {
  filter = "Ping Chen"
  take   = 1
}
