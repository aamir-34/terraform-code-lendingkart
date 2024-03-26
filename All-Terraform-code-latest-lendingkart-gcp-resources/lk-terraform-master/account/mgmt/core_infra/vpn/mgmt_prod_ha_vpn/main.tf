module "mgmt_prod" {
  source            = "../../../../../modules/networking/vpn/ha_vpn"
  project_id        = var.project_id
  region            = var.region
  peer_gcp_gateway  = module.prod_mgmt.self_link
  org               = var.org
  env               = var.env
  region_code       = var.region_code
  destination       = var.destination
  use_case          = "to-prod"
  router_name       = "lk-cr-mgmt-common-as1"
  tunnels = {
    "${var.org}-vpn-tn-${var.env}-${var.destination}-${var.region_code}-01" = {
      bgp_peer = {
        address = "169.254.5.1"
        asn     = 64519
      }
      bgp_peer_options                = null
      bgp_session_range               = "169.254.5.2/30"
      ike_version                     = 2
      vpn_gateway_interface           = 0
      peer_external_gateway_interface = null
      shared_secret                   = ""
      router_int_name                 = "${var.org}-cr-if-${var.env}-${var.destination}-${var.region_code}-01"
      bgp_peer_name                   = "${var.org}-cr-peer-${var.env}-${var.destination}-${var.region_code}-01"
    }

    "${var.org}-vpn-tn-${var.env}-${var.destination}-${var.region_code}-02" = {
      bgp_peer = {
        address = "169.254.6.1"
        asn     = 64519
      }
      bgp_peer_options                = null
      bgp_session_range               = "169.254.6.2/30"
      ike_version                     = 2
      vpn_gateway_interface           = 1
      peer_external_gateway_interface = null
      shared_secret                   = ""
      router_int_name                 = "${var.org}-cr-if-${var.env}-${var.destination}-${var.region_code}-02"
      bgp_peer_name                   = "${var.org}-cr-peer-${var.env}-${var.destination}-${var.region_code}-02"
    }
  }
}

module "prod_mgmt" {
  source            = "../../../../../modules/networking/vpn/gcp_ha_vpn"
  project_id        = var.dest_project_id
  region            = var.region
  router_asn        = 64519
  peer_gcp_gateway  = module.mgmt_prod.self_link
  org               = var.org
  env               = var.destination
  region_code       = var.region_code
  destination       = var.env
  use_case          = "to-mgmt"
  router_advertise_config = {
      groups = []
      mode   = "CUSTOM"
      ip_ranges = {
        "10.95.0.48/28"     = "lk-prod-gke-cluster-range",
        "10.93.0.0/16"      = "lk-gcp-managed-svc-subnet-prod"
      }
    }

  tunnels = {
    "${var.org}-vpn-tn-${var.destination}-${var.env}-${var.region_code}-01" = {
      bgp_peer = {
        address = "169.254.5.2"
        asn     = 64518
      }
      bgp_session_range               = "169.254.5.1/30"
      ike_version                     = 2
      vpn_gateway_interface           = 0
      shared_secret                   = module.mgmt_prod.random_secret
      router_int_name                 = "${var.org}-cr-if-${var.destination}-${var.env}-${var.region_code}-01"
      bgp_peer_name                   = "${var.org}-cr-peer-${var.destination}-${var.env}-${var.region_code}-01"
    }

    "${var.org}-vpn-tn-${var.destination}-${var.env}-${var.region_code}-02" = {
      bgp_peer = {
        address = "169.254.6.2"
        asn     = 64518
      }
      bgp_session_range               = "169.254.6.1/30"
      ike_version                     = 2
      vpn_gateway_interface           = 1
      shared_secret                   = module.mgmt_prod.random_secret
      router_int_name                 = "${var.org}-cr-if-${var.destination}-${var.env}-${var.region_code}-02"
      bgp_peer_name                   = "${var.org}-cr-peer-${var.destination}-${var.env}-${var.region_code}-02"
    }
  }
}