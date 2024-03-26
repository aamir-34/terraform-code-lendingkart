variable "org" {
  type        = string
  description = "Organization short code like lk" 
}
variable "env" {
  type        = string
  description = "Environment code like mgmt/dev/qa/prod"
}
variable "region" {
  type = string
  description = "Region Code like as1"
}
variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
}

variable "labels" {
  type        = map(string)
  description = "Labels, provided as a map"
}

variable "kms_crypto_key_as1" {
  description = "The Customer Managed Encryption Key used to encrypt the boot disk attached to each node in the node pool."
  type        = string
}
