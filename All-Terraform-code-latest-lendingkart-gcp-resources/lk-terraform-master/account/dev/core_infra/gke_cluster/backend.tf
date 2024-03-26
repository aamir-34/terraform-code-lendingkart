terraform {
  backend "gcs" {
    bucket = "lk-bucket-mgmt-terraform"
    prefix = "dev/core_infra/gke_cluster"
  }
}