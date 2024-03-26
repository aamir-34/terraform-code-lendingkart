terraform {
  backend "gcs" {
    bucket = "lk-bucket-mgmt-terraform"
    prefix = "prod/dr_infra/pvt_svc_connection"
  }
}