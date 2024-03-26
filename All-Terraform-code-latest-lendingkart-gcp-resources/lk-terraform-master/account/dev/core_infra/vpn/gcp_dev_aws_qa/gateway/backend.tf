terraform {
  backend "gcs" {
    bucket = "lk-bucket-mgmt-terraform"
    prefix = "dev/core_infra/vpn/gcp_dev_aws_qa/gateway"
  }
}