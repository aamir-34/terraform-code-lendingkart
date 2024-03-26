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

variable "region_code" {}

variable "namespace" {
  default = "statuspage"
}

variable "app_name" {
  type        = string
  default     = "statuspage"
}
variable "labels" {
  description = "A set of key/value label pairs to assign to the bucket."
  type        = map(string)

  validation {
    condition     = can(var.labels["account"])
    error_message = "A account labels is required."
  }
  validation {
    condition     = can(var.labels["env"])
    error_message = "A env labels is required."
  }
}

variable "kms_crypto_key_as1" {
  description = "The Customer Managed Encryption Key used to encrypt the boot disk attached to each node in the node pool."
  type        = string
}