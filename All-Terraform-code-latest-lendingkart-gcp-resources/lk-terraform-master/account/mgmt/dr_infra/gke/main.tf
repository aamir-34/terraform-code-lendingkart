/*
module "gke_cluster" {
  source                 = "../../../../modules/gke/cluster"
  ip_range_pods          = "pod-app-sc-subnet-${var.env}"
  ip_range_services      = "svc-app-sc-subnet-${var.env}"
  master_version         = "1.27.3-gke.100"
  master_ipv4_cidr_block = var.private_cluster_master_ipv4_cidr
  project_id             = var.project_id
  region                 = var.region
  workload_pool          = "${var.project_id}.svc.id.goog"
  labels                 = var.labels
  env                    = var.env
  region_code            = var.region_code

  master_authorized_networks_config = [
    {
      cidr_blocks = [
        {
          cidr_block   = var.vpc_cidr_range
          display_name = "lk_mgmt_vpc"
        },
        {
          cidr_block   = var.lk_blr_onprem_cidr
          display_name = "lk_blr_onprem_cidr"
        },
        {
          cidr_block   = var.lk_blr_vpn_cidr
          display_name = "lk_blr_vpn_cidr"
        }
      ]
    }
  ]
}
*/