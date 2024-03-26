variable "project_id" {}

variable "region" {}

variable "auth_name" {
  default = "mgmt"
}

variable "env" {
  type = string
  default = "mgmt"
}

variable "service_accounts" {
  default = [
                "*"
  ]
}