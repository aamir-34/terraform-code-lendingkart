resource "google_compute_network_peering" "local_network_peering" {
  name                                = "${var.org}-vpc-peer-${var.src}-to-${var.destination}-${var.region_code}"
  network                             = "projects/${var.source_project_id}/global/networks/${var.org}-vpc-${var.src}"      //var.local_network
  peer_network                        = "projects/${var.destination_project_id}/global/networks/${var.org}-vpc-${var.destination}" //var.peer_network
  export_custom_routes                = var.export_local_custom_routes
  import_custom_routes                = var.export_peer_custom_routes
  export_subnet_routes_with_public_ip = var.export_local_subnet_routes_with_public_ip
  import_subnet_routes_with_public_ip = var.export_peer_subnet_routes_with_public_ip
}

resource "google_compute_network_peering" "peer_network_peering" {
  name                                = "${var.org}-vpc-peer-${var.destination}-to-${var.src}-${var.region_code}"
  network                             = "projects/${var.destination_project_id}/global/networks/${var.org}-vpc-${var.destination}" // var.peer_network
  peer_network                        = "projects/${var.source_project_id}/global/networks/${var.org}-vpc-${var.src}"      //var.local_network]
  export_custom_routes                = var.export_peer_custom_routes
  import_custom_routes                = var.export_local_custom_routes
  export_subnet_routes_with_public_ip = var.export_peer_subnet_routes_with_public_ip
  import_subnet_routes_with_public_ip = var.export_local_subnet_routes_with_public_ip

  depends_on = [google_compute_network_peering.local_network_peering]

}