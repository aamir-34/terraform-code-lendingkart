module "cloud_router" {
  source      = "../../../../../modules/networking/vpn/cloud_router"
  env         = var.env
  org         = var.org
  project_id  = var.project_id
  region      = var.region
  region_code = var.region_code
  use_case    = "common"
  router_asn  = 64518
  router_advertise_config = {
      groups = ["ALL_SUBNETS"]
      mode   = "CUSTOM"
    ip_ranges = {
      "10.95.0.48/28"    = "lk-prod-gke-cluster-range",
      "10.95.0.144/28"   = "lk-preprod-gke-cluster-range",
      "10.95.0.32/28"    = "lk-qa-gke-cluster-range",
      "10.95.0.16/28"    = "lk-dev-gke-cluster-range",
      "10.93.0.0/16"     = "lk-gcp-managed-svc-subnet-prod",
      "10.94.0.0/16"     = "lk-gcp-managed-svc-subnet-preprod"
      "10.92.0.0/16"     = "lk-gcp-managed-svc-subnet-qa",
      "10.91.0.0/16"     = "lk-gcp-managed-svc-subnet-dev",
      "172.31.0.0/16"    = "aws_production_vpc",
      "192.168.160.0/21" = "blr-vt-onprem-cidr-range",
      "10.80.80.0/23"    = "blr-forticlient-vpn-cidr-range",
      "192.168.80.0/21"  = "ahm-ibp-onprem-cidr-range",
      "10.20.234.0/24"   = "ahm-sophos-vpn-cidr-range"
    }
    }
}