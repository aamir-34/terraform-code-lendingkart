module "vpn_gateway" {
  source      = "../../../../../../modules/networking/vpn/gcp_aws_ha_vpn/gateway"
  region      = var.region
  project_id  = var.project_id
  org         = var.org
  env         = var.env
  region_code = var.region_code
  destination = "aws-preprod"
  src         = "gcp"
}