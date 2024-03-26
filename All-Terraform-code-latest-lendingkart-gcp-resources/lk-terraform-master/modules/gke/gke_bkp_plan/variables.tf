variable "org" {
  default = "lk"
}
variable "region_code" {
  default = "as1"
}
variable "region" {
  default = "asia-south1"
}

variable "description" {
  default = "GKE Cluster Backup-Plan at Delhi region"
}

variable "project_id" {
  default = ""
}

variable "env" {}
variable "cron_schedule" {}
variable "backup_location" {}
variable "bkp_retain_days" {}

variable "bkp_delete_lock_days" {
  default = ""
}

variable "kms_encryption_key" {
  default = ""
}