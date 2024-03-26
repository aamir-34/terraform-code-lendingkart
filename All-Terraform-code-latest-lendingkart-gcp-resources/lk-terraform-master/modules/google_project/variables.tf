variable "project" {
  description = "Name of the project"
  type        = string
}

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

variable "labels" {
  type        = map(string)
  description = "Labels, provided as a map"
}

variable "billing_account" {
  type        = string
  description = "Billing account of the org"
}
variable "org_id" {
  type        = string
  description = "Org ID of lendingkart.com"
}

variable "auto_create_network" {
  type        = bool
  description = "Auto create default network"
  default     = false
}
