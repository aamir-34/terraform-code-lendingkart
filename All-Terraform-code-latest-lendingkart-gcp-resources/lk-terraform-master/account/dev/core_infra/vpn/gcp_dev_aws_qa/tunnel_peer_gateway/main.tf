module "tunnel_peer_gateway" {
  source                = "../../../../../../modules/networking/vpn/gcp_aws_ha_vpn/tunnel_peer_gateway"
  project_id            = var.project_id
  region                = var.region
  labels                = var.labels
  org                   = var.org
  env                   = var.env
  src                   = var.src
  destination           = var.destination
  use_case              = var.use_case 
  region_code           = var.region_code 
  asn                   = "65000"
  ike_version           = "2"
  router_advertise_config = {
      mode   = "CUSTOM"
      ip_ranges = {
        "10.50.0.0/16"  = "lk-vpc-dev",
        "10.91.0.0/16"  = "lk_gcp_managed_svc_subnet_dev_psc_cidr",
        "10.95.0.16/28" = "lk_gke_dev_as1_cidr"
      }
    }
  external_vpn_gateway_interfaces = {
    "0" = {
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-01"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-01"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-01"
      tunnel_address        = "3.109.73.126"
      vgw_inside_address    = "169.254.167.5"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.167.6/30"
      shared_secret         = "cFNYBSYYrTM3Z.3vdFQBwNZF2m_Q2oyS"
      vpn_gateway_interface = 0
    },
    "1" = {
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-02"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-02"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-02"
      tunnel_address        = "13.233.17.254"
      vgw_inside_address    = "169.254.204.133"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.204.134/30"
      shared_secret         = "b_9QZilvc2rvCX6yA0Azph3G1kJuK5I8"
      vpn_gateway_interface = 0
    },
    "2" = {
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-03"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-03"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-03"
      tunnel_address        = "35.154.96.49"
      vgw_inside_address    = "169.254.105.173"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.105.174/30"
      shared_secret         = "K_iABDwMtxnKNW2yQksUYFON_Xqo3rVZ"
      vpn_gateway_interface = 1
    },
    "3" = {
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-04"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-04"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-04"
      tunnel_address        = "65.1.75.36"
      vgw_inside_address    = "169.254.194.205"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.194.206/30"
      shared_secret         = "zPjeOz_QZ2s7iVYtG0TArp2C78mDlzZS"
      vpn_gateway_interface = 1
    },
  }
}
