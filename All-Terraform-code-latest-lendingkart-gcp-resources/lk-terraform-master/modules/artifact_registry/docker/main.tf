resource "google_artifact_registry_repository" "artifact_registry" {
  location      = var.location
  repository_id = "${var.org}-${var.use_case}-repository" 
  description   = var.description
  format        = var.format
  project       = var.project_id
  labels        = var.labels
  kms_key_name  = var.kms_crypto_key_name
}
