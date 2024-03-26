variable "project_id" {
  type        = string
  description = "The ID of the project that the service account will be created in."
}
variable "env" {
  type        = string
  description = "Environment code like mgmt/dev/qa/prod"
}

variable "region" {
  description = "Name of the region"
  type        = string
}

variable "app_name" {
  default = "kaili"
}