terraform {
  backend "gcs" {
    bucket = "lk-bucket-mgmt-terraform"
    prefix = "prod/ect-cdc-consumer"
  }
}