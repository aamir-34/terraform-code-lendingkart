terraform {
  backend "gcs" {
    bucket = "lk-bucket-mgmt-terraform"
    prefix = "security/core_infra/gcp_managed_sa"
  }
}