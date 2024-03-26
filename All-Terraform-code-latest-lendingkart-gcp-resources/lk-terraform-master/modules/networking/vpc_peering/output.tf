output "local_network_peering_id" {
  description = "ID of the local network peering"
  value       = google_compute_network_peering.local_network_peering.id
}

output "peer_network_peering_id" {
  description = "ID of the peer network peering"
  value       = google_compute_network_peering.peer_network_peering.id
}
