resource "google_compute_address" "address" {
  count = var.module_enabled ? var.number_of_addresses : 0

  depends_on = [var.module_depends_on]

  name          = "${var.org}-ip-${var.env}-${var.use_case}-${var.region_code}-${count.index}"
  address       = var.address
  address_type  = var.address_type
  description   = var.description
  purpose       = var.purpose
  network_tier  = var.network_tier
  subnetwork    = var.subnetwork
  network       = var.network_name
  prefix_length = var.prefix_length
  region        = var.region
  project       = var.project
}