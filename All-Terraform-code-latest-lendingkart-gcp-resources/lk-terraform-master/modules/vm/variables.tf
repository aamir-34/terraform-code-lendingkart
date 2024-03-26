variable "org" {
  type        = string
  description = "Organization short code like lk" 
}
variable "env" {
  type        = string
  description = "Environment code like mgmt/dev/qa/prod"
}
variable "use_case" {
  type        = string
  description = "Resource use case"
  default = "cachet"
}
variable "project_id" {
  description = "The ID of the project to create the bucket in."
  type        = string
}

variable "vm_num" {
  type        = string
  description = "Resource use case"
  default = "01"
}

variable "image" {
    description = "Boot disk image"
    type        = string
}
variable "disk_type" {
    description = "Boot disk image"
    type        = string
}
variable "can_ip_forward" {
    description = "Enable IP forwarding"
    type        = bool
    default = false
}
variable "deletion_protection" {
    description = "VM instance can be protected from accidental deletion"
    type        = bool
    default = false
}
variable "enable_display" {
    description = "Enable to use screen capturing and recording tools"
    type        = bool
    default = false
}
variable "labels" {
  description = "A set of key/value label pairs to assign to the bucket."
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
variable "kms_crypto_key_name" {
  description = "The Customer Managed Encryption Key used to encrypt the boot disk attached to each node in the node pool."
  type        = string
}
variable "region_code" {
  type = string
  description = "Region Code like as1"
}
variable "zone" {
    description = "Name of the zone"
    type        = string
}
variable "machine_type" {
    description = "Name of the machine"
    type        = string
}
variable "queue_count" {
    description = "queue count"
    type        = number
    default = 0
}
variable "stack_type" {
    description = "Type of stack IPV4 or IPV6"
    type        = string
    default = "IPV4_ONLY"
}
variable "min_node_cpus" {
    description = "Number of node CPU's"
    type        = number
    default = 0
}
variable "on_host_maintenance" {
    description = "maintenance of VM"
    type        = string
    default = "MIGRATE"
}
variable "preemptible" {
    description = "Preemptible VM's"
    type        = bool
    default = false
}
variable "email" {
    description = "service account email"
    type        = string
}
variable "scopes" {
    description = "List of API's for accessing"
    type        = list(string)
    default = [ "cloud-platform" ]
}
variable "tags" {
    description = "List of tags"
    type        = list(string)
    default = []
}
variable "size" {
    description = "Size of the boot disk"
    type        = string
}