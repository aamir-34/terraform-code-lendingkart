module "vpc_peering" {
  source                                    = "../../../../../modules/networking/vpc_peering"
  org                                       = var.org
  region_code                               = var.region_code 
  src                                       = "mgmt"
  destination                               = "qa"
  source_project_id                         = var.project_id 
  destination_project_id                    = "lk-qa-apps"
  export_local_subnet_routes_with_public_ip = true
  export_peer_subnet_routes_with_public_ip  = true
}