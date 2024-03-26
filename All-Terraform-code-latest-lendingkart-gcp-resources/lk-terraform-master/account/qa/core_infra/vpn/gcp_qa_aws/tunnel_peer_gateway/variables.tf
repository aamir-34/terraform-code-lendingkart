variable "project_id" {
  type        = string
  description = "project of the resource"
}

variable "region" {
  type        = string
  description = "region of the resource"
}
variable "labels" {
  type        = map(string)
  description = "Labels, provided as a map"
}
variable "vir_pvt_gat_asn" {
  type        = number
  description = "Virtual private gateway asn number from downloaded vpn configuration file"
  default     = "64512" 
}

variable "org" {}

variable "env" {}

variable "region_code" {}

variable "use_case" {
  default = "gcp-aws-qa"
}

variable "destination" {
  default = "aws-qa"
}

variable "src" {
  default = "gcp"
}
