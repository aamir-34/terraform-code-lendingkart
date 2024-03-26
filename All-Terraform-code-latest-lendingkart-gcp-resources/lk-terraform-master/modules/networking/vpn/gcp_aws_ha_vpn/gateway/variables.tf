variable "region" {
  type        = string
  description = "region of the vpn gateway"
}

variable "no_count" {
  type        = string
  description = "count of the vpn gateway"
  default = "01"
}
variable "project_id" {
  type        = string
  description = "Project of the resource"
}
variable "org" {}

variable "env" {}

variable "region_code" {}

variable "destination" {}

variable "src" {}