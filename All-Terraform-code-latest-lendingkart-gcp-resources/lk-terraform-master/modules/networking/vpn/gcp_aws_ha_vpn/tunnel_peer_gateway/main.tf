resource "google_compute_router" "router" {
  name        = "${var.org}-cr-${var.env}-${var.use_case}-${var.region_code}${var.number_count}"
  network     = "${var.org}-vpc-${var.env}"
  project     = var.project_id
  region      = var.region
  description = "Cloud Router for ${var.use_case} "
  bgp {
    asn               = var.asn
    advertise_mode    = "CUSTOM"
    advertised_groups = ["ALL_SUBNETS"]
    dynamic "advertised_ip_ranges" {
      for_each = (
        var.router_advertise_config == null ? {} : (
          var.router_advertise_config.mode != "CUSTOM"
          ? {}
          : var.router_advertise_config.ip_ranges
        )
      )
      iterator = range
      content {
        range       = range.key
        description = range.value
      }
    }
  }
}

resource "google_compute_external_vpn_gateway" "external_gateway" {
  name            = "${var.org}-peer-gw-${var.env}-${var.use_case}-${var.region_code}${var.number_count}"
  project         = var.project_id
  redundancy_type = var.redundancy_type
  description     = "Peer VPN GW ${var.use_case} "
  labels          = var.labels

  dynamic "interface" {
    for_each = var.external_vpn_gateway_interfaces
    content {
      id         = interface.key
      ip_address = interface.value["tunnel_address"]
    }
  }
}

resource "google_compute_vpn_tunnel" "tunnels" {
  for_each                        = var.external_vpn_gateway_interfaces
  region                          = var.region
  name                            = each.value.name_tunnel
  project                         = var.project_id
  description                     = "Tunnel - HA VPN interface ${each.key} to interface ${each.value.tunnel_address}"
  router                          = google_compute_router.router.self_link
  ike_version                     = var.ike_version
  shared_secret                   = each.value.shared_secret
  vpn_gateway                     = "${var.org}-vpn-gw-${var.env}-${var.src}-${var.destination}-${var.region_code}-${var.no_count}"
  vpn_gateway_interface           = each.value.vpn_gateway_interface
  peer_external_gateway           = google_compute_external_vpn_gateway.external_gateway.self_link
  peer_external_gateway_interface = each.key

}

resource "google_compute_router_interface" "interfaces" {
  for_each   = var.external_vpn_gateway_interfaces
  project    = var.project_id
  region     = var.region
  name       = each.value.router_int_name
  router     = google_compute_router.router.name
  ip_range   = each.value.cgw_inside_address
  vpn_tunnel = google_compute_vpn_tunnel.tunnels[each.key].name
}

resource "google_compute_router_peer" "router_peers" {
  for_each        = var.external_vpn_gateway_interfaces
  project         = var.project_id
  region          = var.region
  name            = each.value.router_peer_name
  router          = google_compute_router.router.name
  peer_ip_address = each.value.vgw_inside_address
  peer_asn        = each.value.asn
  interface       = google_compute_router_interface.interfaces[each.key].name
}

