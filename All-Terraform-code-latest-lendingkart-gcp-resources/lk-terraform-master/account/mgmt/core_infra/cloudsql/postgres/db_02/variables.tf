variable "region" {
  description = "Name of the region"
  type        = string
}
variable "project_id" {
  description = "Name of the project"
  type        = string
}
variable "labels" {
  description = "A set of key/value user label pairs to assign to the instance"
  type        = map(string)
}
variable "kms_crypto_key_as1" {
  description = "The Customer Managed Encryption Key used to encrypt the boot disk attached to each node in the node pool."
  type        = string
}

variable "env" {}

variable "app_name" {
  default = "common"
}
