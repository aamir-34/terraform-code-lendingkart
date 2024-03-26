/* variable "vpn_gateway_name" {
  description = "Name of the VPN gateway"
  type        = string
}
variable "network" {
  description = "Name of the network"
  type        = string
}
variable "vpn_static_ip_name" {
  description = "Name of the static ip"
  type        = string
}

variable "vpn_tunnel_name" {
  type = string

}
 variable "vpn_tunnels" {
  description = "vpn tunnels configuration"
  type = map(object({
    vpn_tunnel_name= string
    peer_ip = string
    shared_Secret = string

  }))
}
 */
variable "traffic_selector" {
  description = "traffic selector cidr"
  type        = list(string)
  default     = [ "0.0.0.0/0" ]
}
variable "region" {
  description = "Name of the region"
  type        = string
}
variable "project_id" {
  description = "Name of the project"
  type        = string
}
variable "esp_forwarding_rule_name" {
  description = "Name of the esp forwarding_rule_name"
  type        = string
}

variable "esp_ip_protocol" {
  description = "Name of the protocol"
  type        = string
  default     = "ESP"
}
variable "udp_500_forwarding_rule_name" {
  description = "Name of the udp 500 forwarding_rule_name"
  type        = string
}

variable "udp_ip_protocol" {
  description = "Name of the protocol like UDP, ESP"
  type        = string
  default     = "UDP"
}
variable "udp_500_forwarding_rule_port_range" {
  description = "Port Number"
  type        = string
  default     = "500"
}
variable "udp_4500_forwarding_rule_name" {
  description = "Name of the forwarding_rule_name"
  type        = string
}
variable "udp_4500_forwarding_rule_port_range" {
  description = "Port Number"
  type        = string
  default     = "4500"
} 
variable "peer_ip" {
  type = string

}
variable "shared_Secret" {
  type = string

}
variable "priority" {
  description = "Priority of the route table"
  type        = number
  default     = 1000
}

variable "routes" {
  description = "Routes configuration"
  type = map(object({
    route_table_name = string
    dest_range       = string

  }))
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

variable "src" {
  type = string 
}

variable "destination" {
  type = string
  
}
variable "region_code" {
  type = string
  
}
variable "env" {
  type = string
  
}
variable "use_case" {
  type = string
  
}