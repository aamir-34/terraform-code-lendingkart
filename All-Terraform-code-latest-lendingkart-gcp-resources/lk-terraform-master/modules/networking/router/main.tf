resource "google_compute_router" "router" {
  name    = "${var.org}-cr-${var.env}-${var.use_case}-${var.region_code}"
  project = var.project_id
  region  = var.region
  network = var.network_name
  bgp {
    asn                = var.router_asn
    keepalive_interval = var.router_keepalive_interval
  }
}