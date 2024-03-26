

variable "plan_location" {
  default = "asia-south2"
}

variable "location" {
  default = "asia-south1"
}

variable "project_id" {}
variable "org" {}
variable "env" {}
variable "region_code" {}

variable "namespace" {
  default = "restore-cron"
}

variable "app_name" {
  default = "gke-restore"
}
