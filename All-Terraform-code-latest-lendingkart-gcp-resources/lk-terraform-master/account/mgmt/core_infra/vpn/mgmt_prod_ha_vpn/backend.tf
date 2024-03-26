terraform {
  backend "gcs" {
    bucket = "lk-bucket-mgmt-terraform"
    prefix = "mgmt/core_infra/vpn/mgmt_prod_ha_vpn"
  }
}
