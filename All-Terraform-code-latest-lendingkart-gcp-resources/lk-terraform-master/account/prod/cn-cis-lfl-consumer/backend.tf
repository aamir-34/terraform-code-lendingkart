terraform {
  backend "gcs" {
    bucket = "lk-bucket-mgmt-terraform"
    prefix = "prod/cn-cis-lfl-consumer"
  }
}