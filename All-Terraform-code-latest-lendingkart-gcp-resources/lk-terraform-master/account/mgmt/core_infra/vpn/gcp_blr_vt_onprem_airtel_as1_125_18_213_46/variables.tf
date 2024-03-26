variable "region" {}

variable "project_id" {}

variable "labels" {}

variable "org" {}

variable "src" {
  default = "gcp"
}

variable "destination" {
  default = "blr-vt-onprem-airtel"
}

variable "region_code" {}

variable "env" {}

variable "use_case" {
  default = "vpn-gw-blr-vt-airtel"
  
}