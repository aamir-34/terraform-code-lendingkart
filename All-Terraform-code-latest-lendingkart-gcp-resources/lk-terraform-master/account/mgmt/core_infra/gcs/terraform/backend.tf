terraform {
  backend "gcs" {
    bucket = "lk-bucket-mgmt-terraform"
    prefix = "mgmt/core_infra/gcs/lk-bucket-mgmt-terraform"
  }
}