module "gke_cluster" {
  source                 = "../../../../modules/gke/cluster"
  ip_range_pods          = "pod-app-sc-subnet-${var.env}"
  ip_range_services      = "svc-app-sc-subnet-${var.env}"
  master_version         = "1.28.3-gke.1286000"
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
          display_name = "lk_vpc_dev"
        },
        {
          cidr_block   = var.mgmt_vpc_cidr_range
          display_name = "lk_vpc_mgmt"
        },
        {
          cidr_block   = var.lk_blr_vt_onprem_cidr
          display_name = "lk_blr_vt_onprem_cidr"
        },
        {
          cidr_block   = var.lk_blr_forticlient_vpn_cidr
          display_name = "lk_blr_forticlient_vpn_cidr"
        },
        {
          cidr_block   = "172.31.0.0/16"
          display_name = "aws_production_vpc"
        }
      ]
    }
  ]
}