
variable "plan_location" {
  description = "The location for the restore plan"
  default     = "asia-south2"
}

variable "dr_region_code" {
  description = "The region code of dr restore-plan"
  default     = "as2"
}


variable "location" {
  description = "The location of the backup plan"
  default     = "asia-south1"
}

variable "all_namespaces" {
  description = "Restore all namespaces"
  default     = true
}

variable "namespaced_resource_restore_mode" {
  description = "Namespaced resource restore mode"
  default     = "DELETE_AND_RESTORE"
}

variable "volume_data_restore_policy" {
  description = "Volume data restore policy"
  default     = "RESTORE_VOLUME_DATA_FROM_BACKUP"
}

variable "all_group_kinds" {
  description = "Restore all group kinds in the cluster"
  default     = true
}

variable "cluster_resource_conflict_policy" {
  description = "Cluster resource conflict policy"
  default     = "USE_EXISTING_VERSION"
}


variable "project_id" {}
variable "org" {}
variable "env" {}
variable "region_code" {}

