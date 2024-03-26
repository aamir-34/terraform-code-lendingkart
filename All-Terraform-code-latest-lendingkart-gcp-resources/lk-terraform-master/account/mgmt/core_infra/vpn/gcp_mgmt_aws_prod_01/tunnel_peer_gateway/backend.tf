terraform {
  backend "gcs" {
    bucket = "lk-bucket-mgmt-terraform"
    prefix = "mgmt/core_infra/vpn/gcp_mgmt_aws_prod_01/tunnel_peer_gateway"
  }
}
