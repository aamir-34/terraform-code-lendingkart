terraform {
  backend "gcs" {
    bucket = "lk-bucket-mgmt-terraform"
    prefix = "preprod/core_infra/istio_pub_lb"
  }
}