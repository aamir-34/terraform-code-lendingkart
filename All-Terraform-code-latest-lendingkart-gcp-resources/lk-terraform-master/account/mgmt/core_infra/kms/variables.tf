variable "project_id" {
  type        = string
  description = "The ID of the Google Cloud project."
}
variable "region" {
  type = string
  description = "Region"
  
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
  type = string
  description = "Region Code like as1"
}