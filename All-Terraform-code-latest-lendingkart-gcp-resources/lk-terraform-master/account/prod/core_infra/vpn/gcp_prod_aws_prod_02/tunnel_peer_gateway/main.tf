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
  asn                   = "64520"
  ike_version           = "2"
  no_count              = "02"
  number_count          = "-02"
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
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-05"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-05"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-05"
      tunnel_address        = "3.111.119.237"
      vgw_inside_address    = "169.254.236.121"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.236.122/30"
      shared_secret         = "qQLlJSSJnHTUdqaE9cpvIJfeULK5u9KU"
      vpn_gateway_interface = 0
    },
    "1" = {
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-06"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-06"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-06"
      tunnel_address        = "52.66.126.37"
      vgw_inside_address    = "169.254.236.141"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.236.142/30"
      shared_secret         = "x959QBSD2sAY6PjMkYkzdLgktEc3S3e9"
      vpn_gateway_interface = 0
    },
    "2" = {
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-07"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-07"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-07"
      tunnel_address        = "3.6.54.211"
      vgw_inside_address    = "169.254.215.93"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.215.94/30"
      shared_secret         = "ISk7co9BCH.cbv8uAUmTC.P6o7pSqpuB"
      vpn_gateway_interface = 1
    },
    "3" = {
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-08"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-08"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-08"
      tunnel_address        = "3.109.10.35"
      vgw_inside_address    = "169.254.117.69"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.117.70/30"
      shared_secret         = "dw2Xm.gDdlyUNK6HcjiWO_HzuNoH44fn"
      vpn_gateway_interface = 1
    }
  }
}