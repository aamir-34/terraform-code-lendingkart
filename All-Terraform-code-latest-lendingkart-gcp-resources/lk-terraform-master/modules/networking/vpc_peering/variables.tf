variable "export_local_custom_routes" {
  description = "Whether to export local custom routes"
  type        = bool
  default     = true
}

variable "export_peer_custom_routes" {
  description = "Whether to export peer custom routes"
  type        = bool
  default     = true
}

variable "export_local_subnet_routes_with_public_ip" {
  description = "Whether to export local subnet routes with public IP"
  type        = bool
  default     = false
}

variable "export_peer_subnet_routes_with_public_ip" {
  description = "Whether to export peer subnet routes with public IP"
  type        = bool
  default     = false
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
variable "source_project_id" {
  type = string
  
}
variable "destination_project_id" {
  type = string
  
}
variable "region_code" {
  type = string
  
}


