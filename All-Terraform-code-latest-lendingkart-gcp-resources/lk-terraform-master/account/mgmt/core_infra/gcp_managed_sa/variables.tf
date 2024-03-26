variable "project_id" {
  type        = string
  description = "The ID of the project that the service account will be created in."
}


variable "prefix" {
  description = "Prefix member or group or serviceaccount"
  type        = string
  default     = "serviceAccount"
}

variable "region" {}