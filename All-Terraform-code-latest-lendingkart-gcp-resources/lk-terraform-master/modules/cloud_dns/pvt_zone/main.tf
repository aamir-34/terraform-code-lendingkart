resource "google_dns_managed_zone" "private" {
  count         = var.type == "private" ? 1 : 0
  project       = var.project_id
  name          = var.name
  dns_name      = var.domain
  description   = var.description
  labels        = var.labels
  visibility    = "private"
  force_destroy = var.force_destroy

  dynamic "private_visibility_config" {
    for_each = length(var.private_visibility_config_networks) > 0 ? [1] : []
    content {
      dynamic "networks" {
        for_each = var.private_visibility_config_networks
        content {
          network_url = networks.value
        }
      }
    }
  }
}