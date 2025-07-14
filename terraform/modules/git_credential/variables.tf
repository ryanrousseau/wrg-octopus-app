variable "description" {
  type    = string
  default = ""
}

variable "name" {
  type = string
}

variable "password" {
  type      = string
  sensitive = true
}

variable "space_id" {
  type = string
}

variable "type" {
  type = string
  default = ""
}

variable "username" {
  type    = string
}
