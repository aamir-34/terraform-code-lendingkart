variable "project_id" {
  description = "Name of the project"
  type        = string
}
variable "kms_crypto_key_name" {
  description = "name of the kms crypto key"
  type        = string
}
variable "location" {
  description = "location of the filestore instance"
  type        = string
}
variable "tier" {
  description = "tier type of the filestore instance"
  type        = string
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

variable "capacity_gb" {
  description = "capacity of the filestore instance in GB"
  type        = string
}
variable "fs_name" {
  description = "Name of the fileshare"
  type        = string
}
variable "modes" {
  description = "mode to the filestore instance"
  type        = list(string)
  default     = [ "MODE_IPV4" ]
}

variable "org" {
  type = string
  
}

variable "env" {
  type = string
  
}