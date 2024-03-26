provider "google" {
  project     = var.project_id
  region      = var.region
}

variable "region" {
  description = "Name of the region"
  type        = string
}