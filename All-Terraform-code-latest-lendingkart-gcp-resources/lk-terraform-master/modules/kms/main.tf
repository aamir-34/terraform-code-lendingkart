resource "google_kms_key_ring" "keyring" {
  name     = "${var.org}-kms-keyring-${var.env}-${var.region_code}"
  location = var.keyring_location
  project  = var.project_id
}
