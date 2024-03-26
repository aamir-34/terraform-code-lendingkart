variable "project_id" {}

variable "region" {}

variable "org" {}

variable "env" {}

variable "region_code" {}

variable "vpc_cidr_range" {}

variable "private_cluster_master_ipv4_cidr" {}

variable "lk_blr_vt_onprem_cidr" {}

variable "lk_blr_forticlient_vpn_cidr" {}

variable "labels" {}

variable "mgmt_vpc_cidr_range" {
  default = "10.40.0.0/16"
}
