variable "project_id" {
  description = "Project where resources will be created."
  type        = string
}

variable "region" {
  description = "Region used for resources."
  type        = string
}

variable "router_advertise_config" {
  description = "Router custom advertisement configuration, ip_ranges is a map of address ranges and descriptions."
  type = object({
    groups    = list(string)
    ip_ranges = map(string)
    mode      = optional(string)
  })
  default = null
}

variable "router_asn" {
  description = "Router ASN used for auto-created router."
  type        = number
  default     = 64514
}

variable "keepalive_interval" {
  description = "The interval in seconds between BGP keepalive messages that are sent to the peer."
  type        = number
  default     = 20
}

variable "org" {}

variable "env" {}

variable "region_code" {}

variable "use_case" {}

