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
  no_count              = "01"
  router_advertise_config = {
      mode   = "CUSTOM"
    ip_ranges = {
        "10.40.0.0/16"   = "lk-vpc-mgmt",
        "10.95.0.0/28"   = "lk-mgmt-gke-cluster-range",
        "10.50.0.0/16"   = "lk-vpc-dev",
        "10.95.0.16/28"  = "lk-dev-gke-cluster-range",
        "10.60.0.0/16"   = "lk-vpc-qa",
        "10.95.0.32/28"  = "lk-qa-gke-cluster-range",
        "10.70.0.0/16"   = "lk-vpc-prod",
        "10.95.0.48/28"  = "lk-prod-gke-cluster-range",
        "10.35.0.0/16"   = "lk-vpc-preprod",
        "10.95.0.144/28" = "lk-preprod-gke-cluster-range",
        "10.90.0.0/16"   = "lk-gcp-managed-svc-subnet-mgmt"
      }
    }

  external_vpn_gateway_interfaces = {
    "0" = {
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-01"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-01"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-01"
      tunnel_address        = "15.206.47.214"
      vgw_inside_address    = "169.254.192.149"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.192.150/30"
      shared_secret         = "UUTQ8xnEwbQNYhH4lB49bdN2XbryeCqh"
      vpn_gateway_interface = 0
    },
    "1" = {
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-02"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-02"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-02"
      tunnel_address        = "15.206.180.233"
      vgw_inside_address    = "169.254.55.101"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.55.102/30"
      shared_secret         = ".wSVVN89gF0xlKaFvm70oQBOL7_EaK9i"
      vpn_gateway_interface = 0
    },
    "2" = {
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-03"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-03"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-03"
      tunnel_address        = "3.6.79.192"
      vgw_inside_address    = "169.254.157.5"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.157.6/30"
      shared_secret         = "kUpiJPQVVGIVvAl7y0oL1PJ2D8T5YC3d"
      vpn_gateway_interface = 1
    },
    "3" = {
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-04"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-04"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-04"
      tunnel_address        = "3.109.177.100"
      vgw_inside_address    = "169.254.60.65"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.60.66/30"
      shared_secret         = "S3Y4Q4GAoi3bFMLg.QV_vL3Jqc51qHkp"
      vpn_gateway_interface = 1
    }
  }
}