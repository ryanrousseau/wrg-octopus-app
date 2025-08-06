variable "access_key" {
  type = string
  default = null
}

variable "name" {
  type = string
}

variable "region" {
  type = string
}

variable "secret_key" {
  type      = string
  sensitive = true
  default = null
}

variable "space_id" {
  type = string
}

variable "oidc_authentication" {
  type = object({
    audience = optional(string)
    session_duration = optional(string)
    role_arn = optional(string)
    subject_keys = optional(list(string))
  })
  default = null
}