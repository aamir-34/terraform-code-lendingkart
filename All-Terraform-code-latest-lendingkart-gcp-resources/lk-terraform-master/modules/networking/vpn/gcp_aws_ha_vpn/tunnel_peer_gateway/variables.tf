variable "region" {
  description = "Region name for GCP"
  type        = string
}

variable "project_id" {
  description = "name of GCP Project"
  type        = string
}
variable "asn" {
  description = "Google Cloud side ASN"
  type        = number
}
variable "router_advertise_config" {
  description = "Router custom advertisement configuration, ip_ranges is a map of address ranges and descriptions."
  type = object({
    ip_ranges = map(string)
    mode      = optional(string)

  })
  default = null
}

variable "redundancy_type" {
  type        = string
  description = "the redundancy type of the peer VPN gateway Possible values are FOUR_IPS_REDUNDANCY, SINGLE_IP_INTERNALLY_REDUNDANT, and TWO_IPS_REDUNDANCY"
  default     = "FOUR_IPS_REDUNDANCY"
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
variable "ike_version" {
  type        = number
  description = "IKE protocol version to use when establishing the VPN tunnel with peer VPN gateway"
}

variable "external_vpn_gateway_interfaces" {
  type = map(object({
    name_tunnel           = string
    tunnel_address        = string
    router_int_name       = string
    router_peer_name      = string
    vgw_inside_address    = string
    asn                   = number
    cgw_inside_address    = string
    shared_secret         = string
    vpn_gateway_interface = number
  }))

}

variable "no_count" {
  type        = string
  description = "count of the vpn gateway"
  default = "01"
}
variable "number_count" {
  type        = string
  description = "count of the vpn gateway"
  default = ""
}

variable "org" {}

variable "env" {}

variable "region_code" {}

variable "use_case" {}
variable "use" {
  type = string
  default = "Private Service Connection"
}
variable "destination" {}

variable "src" {}