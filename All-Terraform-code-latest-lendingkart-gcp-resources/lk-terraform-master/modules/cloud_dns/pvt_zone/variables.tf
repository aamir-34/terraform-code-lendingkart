variable "domain" {
  description = "Zone domain, must end with a period."
  type        = string
}

variable "name" {
  description = "Zone name, must be unique within the project."
  type        = string
}

variable "private_visibility_config_networks" {
  description = "List of VPC self links that can see this zone."
  default     = []
  type        = list(string)
}

variable "project_id" {
  description = "Project id for the zone."
  type        = string
}

variable "description" {
  description = "zone description (shown in console)"
  default     = "Managed by Terraform"
  type        = string
}

variable "type" {
  description = "Type of zone to create, valid values are 'public', 'private', 'forwarding', 'peering', 'reverse_lookup' and 'service_directory'."
  default     = "private"
  type        = string
}

variable "labels" {
  type        = map(any)
  description = "A set of key/value label pairs to assign to this ManagedZone"
  default     = {}
}


variable "force_destroy" {
  description = "Set this true to delete all records in the zone."
  default     = false
  type        = bool
}

variable "enable_logging" {
  description = "Enable query logging for this ManagedZone"
  default     = false
  type        = bool
}