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
  use = "GKE"
  router_advertise_config = {
      mode   = "CUSTOM"
      ip_ranges = {
        "10.70.0.0/16"  = "lk-vpc-prod",
        "10.93.0.0/16"  = "lk_gcp_managed_svc_subnet_prod_psc_cidr",
        "10.95.0.48/28" = "lk_gke_prod_as1_cidr"
      }
    }


  external_vpn_gateway_interfaces = {
    "0" = {
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-01"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-01"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-01"
      tunnel_address        = "13.234.135.156"
      vgw_inside_address    = "169.254.177.73"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.177.74/30"
      shared_secret         = "yEeXM0sFYB.hKyl42I0f2V1po1gynBeY"
      vpn_gateway_interface = 0
    },
    "1" = {
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-02"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-02"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-02"
      tunnel_address        = "65.2.76.120"
      vgw_inside_address    = "169.254.39.165"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.39.166/30"
      shared_secret         = "jQ8DRzEqEvbUi_fozBPgbd.x3UCL6ZvD"
      vpn_gateway_interface = 0
    },
    "2" = {
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-03"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-03"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-03"
      tunnel_address        = "13.233.0.215"
      vgw_inside_address    = "169.254.86.201"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.86.202/30"
      shared_secret         = "8x4eb8W1u6xomxT9Lda9o0UkTGv6FZM8"
      vpn_gateway_interface = 1
    },
    "3" = {
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-04"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-04"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-04"
      tunnel_address        = "52.66.83.4"
      vgw_inside_address    = "169.254.72.229"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.72.230/30"
      shared_secret         = "o0.a6ExGcWtK.Xic30h6rmFGo4bkwVpv"
      vpn_gateway_interface = 1
    }
  }
}