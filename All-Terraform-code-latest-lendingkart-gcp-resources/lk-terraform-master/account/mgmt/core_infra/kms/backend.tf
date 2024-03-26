terraform {
  backend "gcs" {
    bucket = "lk-bucket-mgmt-terraform"
    prefix = "mgmt/core_infra/kms-keyring/lk-crypto-key-mgmt-as1"
  }
}