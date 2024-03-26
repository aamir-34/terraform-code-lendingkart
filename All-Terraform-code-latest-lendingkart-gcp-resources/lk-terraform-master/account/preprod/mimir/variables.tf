variable "project_id" {
  type        = string
  description = "The ID of the project that the service account will be created in."
}
variable "org" {
  type        = string
  description = "Organization short code like lk"
}
variable "env" {
  type        = string
  description = "Environment code like mgmt/dev/qa/prod"
}

variable "region" {
  description = "Name of the region"
  type        = string
}

variable "namespace" {
  default = "mimir"
}

variable "app_name" {
  default = "mimir"
}

variable "use_case" {
  default = "mimir"
}

variable "labels" {
  type        = map(string)
  description = "Labels, provided as a map"
}

variable "kms_crypto_key_as1" {}