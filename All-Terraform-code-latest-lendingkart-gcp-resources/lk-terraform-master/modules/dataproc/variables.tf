variable "staging_bucket" {
  description = "Staging bucket for Dataproc"
}

variable "machine_type" {
  description = "Machine type for master and worker vm"
}

variable "org" {
  type        = string
  description = "Organization short code like lk"
}

variable "env" {
  type        = string
  description = "Environment code like mgmt/dev/qa/prod"
}

variable "region_code" {
  type        = string
  description = "Region Code like as1"
}

variable "region" {
  type        = string
  description = "Region"
}
variable "project_id" {}

variable "app_name" {}

variable "num_workers" {
  description = "Number of worker nodes"
}

variable "image_version" {
  description = "image of version "
}

variable "service_account" {
  description = "Machine type for worker vm"
}

variable "service_account_scopes" {
  description = "scopes for service account"
}

variable "boot_disk_type" {
  default = "pd-standard"
}
variable "dataproc_master_bootdisk" {
  default = "200"
}
variable "dataproc_worker_bootdisk" {
  default = "200"
}

variable "dataproc_metastore" {}
