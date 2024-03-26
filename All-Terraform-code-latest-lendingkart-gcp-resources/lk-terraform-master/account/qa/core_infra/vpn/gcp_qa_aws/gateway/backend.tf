terraform {
  backend "gcs" {
    bucket = "lk-bucket-mgmt-terraform"
    prefix = "qa/core_infra/vpn/gcp_qa_aws/gateway"
  }
}