module "cloud_dns_pvt_zone" {
  source      = "../../../../modules/cloud_dns/pvt_zone"
  domain      = "lendingkart.io."
  name        = "private-lendingkart-io"
  project_id  = var.project_id
  description = "Its private cloud dns zone, managed by terraform"

  private_visibility_config_networks = [
    "https://www.googleapis.com/compute/v1/projects/lk-mgmt-apps/global/networks/lk-vpc-mgmt",
    "https://www.googleapis.com/compute/v1/projects/lk-dev-apps/global/networks/lk-vpc-dev",
    "https://www.googleapis.com/compute/v1/projects/lk-qa-apps/global/networks/lk-vpc-qa",
    "https://www.googleapis.com/compute/v1/projects/lk-preprod-apps/global/networks/lk-vpc-preprod",
    "https://www.googleapis.com/compute/v1/projects/lk-prod-apps/global/networks/lk-vpc-prod"
  ]
}