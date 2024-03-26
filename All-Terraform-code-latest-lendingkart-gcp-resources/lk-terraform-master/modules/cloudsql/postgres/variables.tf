variable "region" {
  description = "Name of the region"
  type        = string
}
variable "database_version" {
  description = "version of the database"
  type        = string
}

variable "db_type" {
  default = ""
}

variable "project_id" {
  description = "Name of the project"
  type        = string
}
variable "activation_policy" {
  description = "This specifies when the instance should be active. Can be either ALWAYS, NEVER or ON_DEMAND"
  type        = string
  default     = "ALWAYS"
}
variable "availability_type" {
  description = "The availability type of the Cloud SQL instance, high availability (REGIONAL) or single zone (ZONAL)"
  type        = string
  default     = "ZONAL"
}
variable "retained_backups" {
  description = "Number of backups to retain"
  type        = number
  default     = 7
}
variable "retention_unit" {
  description = "The unit that 'retainedBackups' represents. Defaults to COUNT"
  type        = string
  default     = "COUNT"
}

variable "enabled" {
  description = "True if backup configuration is enabled"
  type        = bool
  default     = true
}
/*variable "location" {
    description = "Location of the backup configuration"
    type        = string
}*/
variable "point_in_time_recovery_enabled" {
  description = "True if Point-in-time recovery is enabled"
  type        = bool
  default     = true
}
variable "start_time" {
  description = "HH:MM format time indicating when backup configuration starts"
  type        = string
  default     = "07:30"
}
variable "transaction_log_retention_days" {
  description = "The number of days of transaction logs we retain for point in time restore, from 1-7"
  type        = number
  default     = 7
}
variable "disk_autoresize" {
  description = "Configuration to increase storage size automatically"
  type        = bool
  default     = false
}
variable "disk_autoresize_limit" {
  description = "configuration to resize the disk"
  type        = number
  default     = 0
}
variable "disk_size" {
  description = "The size of data disk, in GB"
  type        = string
}
variable "disk_type" {
  description = "The type of data disk: PD_SSD or PD_HDD"
  type        = string
  default     = "PD_SSD"
}
variable "ipv4_enabled" {
  description = "Whether this Cloud SQL instance should be assigned a public IPV4 address"
  type        = bool
  default     = false
}
variable "zone" {
  description = "The preferred compute engine zone"
  type        = string
}
variable "day" {
  description = "Day of week (1-7), starting on Monday"
  type        = number
  default     = 6
}
variable "hour" {
  description = "Hour of day (0-23), ignored if day not set"
  type        = number
  default     = 8
}
variable "tier" {
  description = "The machine type to use"
  type        = string
}
variable "user_labels" {
  description = "A set of key/value user label pairs to assign to the instance"
  type        = map(string)

  validation {
    condition     = can(var.user_labels["account"])
    error_message = "A account labels is required."
  }
  validation {
    condition     = can(var.user_labels["env"])
    error_message = "A env labels is required."
  }
}
variable "kms_crypto_key_name" {
  description = "The Customer Managed Encryption Key used to encrypt the boot disk attached to each node in the node pool."
  type        = string
}
variable "deletion_protection" {
  description = "Used to block Terraform from deleting a SQL Instance"
  type        = bool
  default     = true
}
variable "require_ssl" {
  description = "Whether SSL connections over IP are enforced or not"
  type        = bool
  default     = false
}
variable "pricing_plan" {
  description = "Pricing plan for this instance,can only be PER_USE"
  type        = string
}
variable "min_length" {
  description = "Specifies the minimum number of characters that the password must have."
  type        = number
  default     = 25
}
variable "complexity" {
  description = "Checks if the password is a combination of lowercase, uppercase, numeric, and non-alphanumeric characters."
  type        = string
  default     = "COMPLEXITY_DEFAULT"
}
variable "enable_password_policy" {
  description = "Enables or disable the password validation policy."
  type        = bool
  default     = true
}
/*
variable "password" {
  description = "password for the user"
  type        = string
  sensitive   = true
}
*/

variable engine_type {
  type = string
}

variable "org" {
  default = "lk"
}

variable "env" {}

variable "db_num" {
  default = ""
}