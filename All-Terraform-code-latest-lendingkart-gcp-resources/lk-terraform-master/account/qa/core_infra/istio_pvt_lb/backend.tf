terraform {
  backend "gcs" {
    bucket = "lk-bucket-mgmt-terraform"
    prefix = "qa/core_infra/istio_pvt_lb"
  }
}