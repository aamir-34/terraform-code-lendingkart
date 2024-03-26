resource "google_dns_managed_zone" "public" {
  count         = var.type == "public" ? 1 : 0
  project       = var.project_id
  name          = var.name
  dns_name      = var.domain
  description   = var.description
  labels        = var.labels
  visibility    = "public"
  force_destroy = var.force_destroy
  dnssec_config {
      state = var.dnssec_config
  }
  cloud_logging_config {
    enable_logging = var.enable_logging
  }
}