terraform {
  backend "gcs" {
    bucket = "lk-bucket-mgmt-terraform"
    prefix = "prod/core_infra/vpn/gcp_prod_aws_prod_01/gateway"
  }
}
