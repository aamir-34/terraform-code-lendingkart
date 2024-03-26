output "local_network_peering_id" {
  value = module.vpc_peering.local_network_peering_id
}
output "peer_network_peering_id" {
  value = module.vpc_peering.peer_network_peering_id
}