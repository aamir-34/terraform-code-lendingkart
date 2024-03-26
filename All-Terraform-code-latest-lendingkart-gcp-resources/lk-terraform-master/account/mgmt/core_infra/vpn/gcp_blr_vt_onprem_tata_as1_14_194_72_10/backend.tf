terraform {
  backend "gcs" {
    bucket = "lk-bucket-mgmt-terraform"
    prefix = "mgmt/core_infra/vpn/gcp_blr_onprem_tata_as1_14_194_72_10"
  }
}