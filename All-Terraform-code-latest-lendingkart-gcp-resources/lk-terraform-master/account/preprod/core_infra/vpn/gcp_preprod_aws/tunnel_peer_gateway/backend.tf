terraform {
  backend "gcs" {
    bucket = "lk-bucket-mgmt-terraform"
    prefix = "preprod/core_infra/vpn/gcp_preprod_aws/tunnel_peer_gateway"
  }
}
