output "kms_key_name" {
  value = google_kms_key_ring.keyring.name
}