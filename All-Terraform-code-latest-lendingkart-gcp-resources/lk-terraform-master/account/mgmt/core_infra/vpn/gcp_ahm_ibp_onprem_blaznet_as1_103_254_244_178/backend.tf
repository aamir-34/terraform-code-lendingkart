terraform {
  backend "gcs" {
    bucket = "lk-bucket-mgmt-terraform"
    prefix = "mgmt/core_infra/vpn/gcp_ahm_onprem_blaznet_as1_103_254_244_178"
  }
}