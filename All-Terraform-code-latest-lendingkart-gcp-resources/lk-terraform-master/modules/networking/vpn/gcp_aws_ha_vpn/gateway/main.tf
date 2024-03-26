resource "google_compute_ha_vpn_gateway" "vpn_gateway" {
  region  = var.region
  name    = "${var.org}-vpn-gw-${var.env}-${var.src}-${var.destination}-${var.region_code}-${var.no_count}"
  network = "${var.org}-vpc-${var.env}"
  project = var.project_id
}

