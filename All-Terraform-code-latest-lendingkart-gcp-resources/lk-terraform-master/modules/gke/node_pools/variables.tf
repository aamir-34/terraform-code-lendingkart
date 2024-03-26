variable "org" {
  default = "lk"
}
variable "env" {}

variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "location" {
  description = "region of the gke"
  type        = string
}

variable "kms_crypto_key_name" {
  description = "The Customer Managed Encryption Key used to encrypt the boot disk attached to each node in the node pool."
  type        = string
}

variable "gke_cluster_name" {
  description = "GKE Cluster Name"
  type        = string
  
}
variable "labels" {
  description = "Labels"
  type        = map(string) 
  validation {
    condition     = can(var.labels["account"])
    error_message = "A account labels is required."
  }
  validation {
    condition     = can(var.labels["env"])
    error_message = "A env labels is required."
  }
  
}

variable "max_pods_per_node" {
  default     = null
  description = "(Optional) The maximum number of pods per node in this node pool."
}

variable "node_pool" {
  description = "Map of node pool configurations"
  type = map(object({
    max_node_count              = number
    min_node_count              = number
    auto_repair                 = optional(bool, "true")
    auto_upgrade                = optional(bool, "false")
    node_locations              = list(string)
    disk_size_gb                = optional(number, "300")
    disk_type                   = optional(string, "pd-balanced")
    image_type                  = optional(string, "COS_CONTAINERD")
    local_ssd_count             = optional(number, "0")
    machine_type                = string
    oauth_scopes                = list(string)
    spot                        = optional(bool, "false")
    enable_integrity_monitoring = optional(bool, "true")
    enable_secure_boot          = optional(bool, "true")
    node_count                  = optional(number, "1")
    max_surge                   = optional(number, "2")
    max_unavailable             = optional(number, "1")
    node_version                = string
  }))
}