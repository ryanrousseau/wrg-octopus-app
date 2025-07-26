variable "development_name" {
  type    = string
  default = "Development"
}

variable "lifecycle_name" {
  type    = string
  default = "Development > Test > Production"
}

variable "production_name" {
  type    = string
  default = "Production"
}

variable "space_id" {
  type = string
}

variable "test_name" {
  type    = string
  default = "Homologation"
}
