variable "org" {
  type        = string
  description = "Organization short code like lk"
  default = "lk"
}
variable "env" {
  type        = string
  description = "Environment code like mgmt/dev/qa/prod"
}
variable "region_code" {
  type        = string
  description = "Region Code like as1"
  default = "as1"
}
variable "keyring_location" {
  type        = string
  description = "The location of the KMS key ring."
  default = "asia-south1"
}

variable "project_id" {
  type        = string
  description = "The ID of the Google Cloud project."
}
