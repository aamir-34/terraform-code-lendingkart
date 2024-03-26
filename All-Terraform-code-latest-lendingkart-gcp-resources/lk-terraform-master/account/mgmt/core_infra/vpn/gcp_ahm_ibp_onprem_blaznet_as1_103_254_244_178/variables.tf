variable "region" {}

variable "project_id" {}

variable "labels" {}

variable "org" {}

variable "src" {
  default = "gcp"
}

variable "destination" {
  default = "ahm-ibp-onprem-blaznet"
}

variable "region_code" {}

variable "env" {}

variable "use_case" {
  default = "vpn-gw-ahm-ibp-blaznet"
}