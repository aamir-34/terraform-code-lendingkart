variable "project_id" {}
variable "region" {}
variable "env" {
  type = string
}
variable "appname" {
  default = "ect-cdc-consumer"
}