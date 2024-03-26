module "blr_onprem_classic_vpn_125_18_213_46" {

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
  udp_500_forwarding_rule_name        = "lk-fr-udp500-ahm-ibp-blaznet"
  udp_4500_forwarding_rule_name       = "lk-fr-udp4500-ahm-ibp-blaznet"
  esp_forwarding_rule_name            = "lk-fr-esp-ahm-ibp-blaznet"
  peer_ip                             = "103.254.244.178"
  shared_Secret                       = "Rxo2TGuFpPHdAq2q8TCk0kkiHdQKmtCn"

  routes = {
    "0" = {
      route_table_name = "${var.org}-vpn-rt-${var.env}-${var.src}-${var.destination}-${var.region_code}-01"
      dest_range       = "192.168.80.0/21"
    }
    "1" = {
      route_table_name = "${var.org}-vpn-rt-${var.env}-${var.src}-${var.destination}-${var.region_code}-02"
      dest_range       = "10.20.234.0/24"
    }
  }
}