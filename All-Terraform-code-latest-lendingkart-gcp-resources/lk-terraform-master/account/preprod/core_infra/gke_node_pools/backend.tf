terraform {
  backend "gcs" {
    bucket = "lk-bucket-mgmt-terraform"
    prefix = "preprod/core_infra/gke_node_pools"
  }
}