module "blr_onprem_classic_vpn_14_194_72_10" {

  source                              = "../../../../../modules/networking/vpn/route_based"
  region                              = var.region
  project_id                          = var.project_id
  labels                              = var.labels
  org                                 = var.org
  env                                 = var.env
  destination                         = var.destination
  src                                 = var.src
  region_code                         = var.region_code
  use_case                            = var.use_case
  udp_500_forwarding_rule_name        = "lk-fr-udp500-blr-vt-tata"
  udp_4500_forwarding_rule_name       = "lk-fr-udp4500-blr-vt-tata"
  esp_forwarding_rule_name            = "lk-fr-esp-blr-vt-tata"
  peer_ip                             = "14.194.72.10"
  shared_Secret                       = "Tony8e0x576p3CX7ITXjGXD6QhLzmGKw"

  routes = {
    "0" = {
      route_table_name = "${var.org}-vpn-rt-${var.env}-${var.src}-${var.destination}-${var.region_code}-01"
      dest_range       = "192.168.160.0/21"
    }
    "1" = {
      route_table_name = "${var.org}-vpn-rt-${var.env}-${var.src}-${var.destination}-${var.region_code}-02"
      dest_range       = "10.80.80.0/23"
    }
  }
}