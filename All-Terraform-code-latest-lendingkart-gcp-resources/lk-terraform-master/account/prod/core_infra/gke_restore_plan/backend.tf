terraform {
  backend "gcs" {
    bucket = "lk-bucket-mgmt-terraform"
    prefix = "prod/core_infra/gke_restore_plan"
  }
}
