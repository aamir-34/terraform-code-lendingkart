resource "google_compute_vpn_gateway" "vpn_gateway" {
  name    = "${var.org}-vpn-gw-${var.env}-${var.src}-${var.destination}-${var.region_code}-01"
  network = "${var.org}-vpc-${var.env}"
  region  = var.region
  project = var.project_id

}

resource "google_compute_address" "vpn_static_ip" {
  name    = "${var.org}-ip-${var.env}-${var.use_case}-${var.region_code}"
  project = var.project_id
  region  = var.region
}

resource "google_compute_forwarding_rule" "fr_esp" {
  name        = var.esp_forwarding_rule_name
  ip_protocol = var.esp_ip_protocol
  project     = var.project_id
  region      = var.region
  ip_address  = google_compute_address.vpn_static_ip.address
  target      = google_compute_vpn_gateway.vpn_gateway.id
  labels      = var.labels
}

resource "google_compute_forwarding_rule" "fr_udp500" {
  name        = var.udp_500_forwarding_rule_name
  ip_protocol = var.udp_ip_protocol
  port_range  = var.udp_500_forwarding_rule_port_range
  project     = var.project_id
  region      = var.region
  ip_address  = google_compute_address.vpn_static_ip.address
  target      = google_compute_vpn_gateway.vpn_gateway.id
  labels      = var.labels
}

resource "google_compute_forwarding_rule" "fr_udp4500" {
  name        = var.udp_4500_forwarding_rule_name
  ip_protocol = var.udp_ip_protocol
  port_range  = var.udp_4500_forwarding_rule_port_range
  project     = var.project_id
  region      = var.region
  ip_address  = google_compute_address.vpn_static_ip.address
  target      = google_compute_vpn_gateway.vpn_gateway.id
  labels      = var.labels
}

resource "google_compute_vpn_tunnel" "vpn_tunnels" {
  name                    = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-01"
  peer_ip                 = var.peer_ip
  project                 = var.project_id
  local_traffic_selector  = var.traffic_selector
  remote_traffic_selector = var.traffic_selector
  shared_secret           = var.shared_Secret

  target_vpn_gateway = google_compute_vpn_gateway.vpn_gateway.id

  depends_on = [
    google_compute_forwarding_rule.fr_esp,
    google_compute_forwarding_rule.fr_udp500,
    google_compute_forwarding_rule.fr_udp4500,
  ]
}

resource "google_compute_route" "routes" {
  for_each   = var.routes
  name       = each.value.route_table_name
  network    = "${var.org}-vpc-${var.env}"
  dest_range = each.value.dest_range
  priority   = var.priority
  project    = var.project_id

  next_hop_vpn_tunnel = google_compute_vpn_tunnel.vpn_tunnels.id
}
