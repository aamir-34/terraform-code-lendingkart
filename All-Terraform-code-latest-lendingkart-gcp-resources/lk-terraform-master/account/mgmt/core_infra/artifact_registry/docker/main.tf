module "artifact_registry" {
  source              = "../../../../../modules/artifact_registry/docker"
  kms_crypto_key_name = var.kms_crypto_key_as1
  location            = var.region
  description         = "Artifact registry for ${var.use_case}"
  project_id          = var.project_id
  labels              = var.labels
  use_case            = var.use_case
  org                 = var.org
}