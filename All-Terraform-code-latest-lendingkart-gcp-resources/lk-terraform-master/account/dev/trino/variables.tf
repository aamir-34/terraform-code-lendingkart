variable "project_id" {}
variable "region" {}
variable "env" {
  type = string
}
variable "appname" {
  default = "trino"
}
variable "org" {
  type        = string
  description = "Organization short code like lk"
}