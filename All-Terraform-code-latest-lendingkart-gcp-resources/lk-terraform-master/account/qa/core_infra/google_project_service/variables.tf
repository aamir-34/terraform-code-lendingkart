# variable "project" {
#   description = "Name of the project"
#   type        = string
# }

variable "project_id" {
  description = "ID of the project"
  type        = string
}

variable "region" {
  type        = string
  description = "Region where the resource needs to be created"
}

variable "env" {
  type        = string
  description = "Resource description"
}


variable "enable_apis" {
  type        = bool
  description = "Actually enable the APIs listed"
  default     = true
}

variable "list_activate_apis" {
  type        = list(string)
  description = "List of APIs that needs to be enabled"
  default     = ["iam.googleapis.com"]
}

variable "disable_on_destroy" {
  type        = bool
  description = "Boolean value to decide whether enable or disable project service during destroy"
  default     = true
}

variable "disable_dependent_services" {
  type        = bool
  description = "Boolean value to decide whether enable or disable project service during destroy"
  default     = true
}
