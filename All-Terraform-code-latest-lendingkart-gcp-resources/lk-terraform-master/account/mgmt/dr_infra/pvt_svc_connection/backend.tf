terraform {
  backend "gcs" {
    bucket = "lk-bucket-mgmt-terraform"
    prefix = "mgmt/dr_infra/pvt_svc_connection"
  }
}
