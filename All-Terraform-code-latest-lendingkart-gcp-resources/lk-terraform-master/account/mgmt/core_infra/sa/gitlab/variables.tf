variable "project_id" {
  type        = string
  description = "The ID of the project that the service account will be created in."
}
variable "org" {
  type        = string
  description = "Organization short code like lk" 
}
variable "env" {
  type        = string
  description = "Environment code like mgmt/dev/qa/prod"
}
variable "app_name" {
  type        = string
  default     = "gitlab"
}
variable "region" {
  description = "Name of the region"
  type        = string
}