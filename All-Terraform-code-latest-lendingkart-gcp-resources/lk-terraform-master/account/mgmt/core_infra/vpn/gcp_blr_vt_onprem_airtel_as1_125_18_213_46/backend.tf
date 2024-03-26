terraform {
  backend "gcs" {
    bucket = "lk-bucket-mgmt-terraform"
    prefix = "mgmt/core_infra/vpn/gcp_blr_onprem_airtel_as1_125_18_213_46"
  }
}