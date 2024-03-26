variable "project_id" {
  description = "Name of the project"
  type        = string
}
variable "kms_crypto_key_name" {
  description = "name of the kms crypto"
  type        = string
}
variable "labels" {
  type        = map(string)
  description = "Labels, provided as a map"
}
variable "location" {
  description = "location of the filestore instance"
  type        = string
  default     = "asia-south1"
}
variable "region" {}
variable "org" {}
variable "env" {}






