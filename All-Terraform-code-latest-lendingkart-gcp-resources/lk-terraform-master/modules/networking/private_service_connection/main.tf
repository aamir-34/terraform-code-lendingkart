resource "google_compute_global_address" "gcp_managed_svc_subnet_ranges" {
  address       = var.address
  address_type  = var.address_type
  name          = "${var.org}-gcp-managed-${var.use_case}-subnet-${var.env}"
  network       = "${var.org}-vpc-${var.env}"
  prefix_length = var.prefix_length
  project       = var.project_id
  purpose       = var.purpose
}
resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = "${var.org}-vpc-${var.env}"
  service                 = var.service
  reserved_peering_ranges = [google_compute_global_address.gcp_managed_svc_subnet_ranges.name]
}

resource "google_compute_network_peering_routes_config" "peering_routes" {
  peering = "servicenetworking-googleapis-com"
  network = "${var.org}-vpc-${var.env}"
  project = var.project_id
  import_custom_routes = true
  export_custom_routes = true
}