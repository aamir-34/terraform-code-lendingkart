module "vpc_peering" {
  source                                    = "../../../../../modules/networking/vpc_peering"
  org                                       = var.org
  region_code                               = var.region_code
  src                                       = "mgmt"
  destination                               = "preprod"
  source_project_id                         = var.project_id
  destination_project_id                    = "lk-preprod-apps"
  export_local_subnet_routes_with_public_ip = true
  export_peer_subnet_routes_with_public_ip  = true
}