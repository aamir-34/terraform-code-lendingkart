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
        "10.60.0.0/16"  = "lk-vpc-qa",
        "10.92.0.0/16"  = "lk_gcp_managed_svc_subnet_qa_psc_cidr",
        "10.95.0.32/28" = "lk_gke_qa_as1_cidr"
      }
    }

  external_vpn_gateway_interfaces = {
    "0" = {
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-01"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-01"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-01"
      tunnel_address        = "13.127.235.176"
      vgw_inside_address    = "169.254.188.133"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.188.134/30"
      shared_secret         = "WkYvrDnsUCjPUC4GcO0GcXcDvE6CGqyx"
      vpn_gateway_interface = 0
    },
    "1" = {
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-02"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-02"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-02"
      tunnel_address        = "43.204.162.226"
      vgw_inside_address    = "169.254.107.177"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.107.178/30"
      shared_secret         = "FuOgAODWnWGSIwCksFexfqhevoBnujRy"
      vpn_gateway_interface = 0
    },
    "2" = {
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-03"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-03"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-03"
      tunnel_address        = "13.232.39.179"
      vgw_inside_address    = "169.254.40.173"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.40.174/30"
      shared_secret         = "9Q.2RC_WEX4yS9XcLNYTvjE2e0njthCr"
      vpn_gateway_interface = 1
    },
    "3" = {
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-04"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-04"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-04"
      tunnel_address        = "43.204.43.174"
      vgw_inside_address    = "169.254.137.69"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.137.70/30"
      shared_secret         = "7alIO1FUSzQ.B7VokKhzzXa9W3Q0vQCp"
      vpn_gateway_interface = 1
    },
  }
}
