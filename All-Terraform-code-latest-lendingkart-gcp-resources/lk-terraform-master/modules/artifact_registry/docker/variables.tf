variable "project_id" {
  description = "Name of the project"
  type        = string
}
variable "kms_crypto_key_name" {
  description = "name of the kms crypto key"
  type        = string
}
variable "location" {
  description = "Name of the location where this repository located in"
  type        = string
}
variable "description" {
  description = "Description of the repository"
  type        = string
}
variable "format" {
  description = "The format of packages that are stored in the repository"
  type        = string
  default     = "DOCKER"
}

variable "labels" {
  type        = map(string)
  description = "Labels, provided as a map"

  validation {
    condition     = can(var.labels["account"])
    error_message = "A account labels is required."
  }
  validation {
    condition     = can(var.labels["env"])
    error_message = "A env labels is required."
  }
}
variable "org" {
  type = string
  
}
variable "use_case" {
  type = string
  
}
