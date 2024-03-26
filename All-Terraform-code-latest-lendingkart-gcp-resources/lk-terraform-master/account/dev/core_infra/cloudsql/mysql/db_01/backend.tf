terraform {
  backend "gcs" {
    bucket = "lk-bucket-mgmt-terraform"
    prefix = "dev/core_infra/cloudsql/mysql/db_01"
  }
}