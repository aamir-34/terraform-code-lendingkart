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
        "10.35.0.0/16"   = "lk-vpc-preprod",
        "10.94.0.0/16"   = "lk_gcp_managed_svc_subnet_preprod_psc_cidr",
        "10.95.0.144/28" = "lk_gke_preprod_as1_cidr"
      }
    }
  external_vpn_gateway_interfaces = {
    "0" = {
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-01"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-01"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-01"
      tunnel_address        = "3.6.211.133"
      vgw_inside_address    = "169.254.82.217"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.82.218/30"
      shared_secret         = "lZj3fGFpLlOcqEnctrDPcBJpjpClZGlZ"
      vpn_gateway_interface = 0
    },
    "1" = {
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-02"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-02"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-02"
      tunnel_address        = "13.232.142.126"
      vgw_inside_address    = "169.254.42.121"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.42.122/30"
      shared_secret         = "SDeEqe6nTi73RTy.TpW2zYjWOut8mGTy"
      vpn_gateway_interface = 0
    },
    "2" = {
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-03"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-03"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-03"
      tunnel_address        = "3.110.249.172"
      vgw_inside_address    = "169.254.85.21"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.85.22/30"
      shared_secret         = "jgihkVH_wQdJ1ya8PkdAp6k4nW53ci7P"
      vpn_gateway_interface = 1
    },
    "3" = {
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-04"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-04"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-04"
      tunnel_address        = "13.127.205.43"
      vgw_inside_address    = "169.254.196.13"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.196.14/30"
      shared_secret         = "EhWT_A3at2nI97HKFQWxoondxNL1l.bF"
      vpn_gateway_interface = 1
    }
  }
}
