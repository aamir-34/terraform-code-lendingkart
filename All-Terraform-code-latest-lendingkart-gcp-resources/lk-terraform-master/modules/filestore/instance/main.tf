resource "google_filestore_instance" "fs_instance" {
  name     = "${var.org}-filestore-${var.env}"
  location = var.location
  tier     = var.tier
  labels   = var.labels
  project  = var.project_id
  file_shares {
    capacity_gb = var.capacity_gb
    name        = var.fs_name
  }
  networks {
    network = "${var.org}-vpc-${var.env}"
    modes   = var.modes

  }
  kms_key_name = var.kms_crypto_key_name 
}

