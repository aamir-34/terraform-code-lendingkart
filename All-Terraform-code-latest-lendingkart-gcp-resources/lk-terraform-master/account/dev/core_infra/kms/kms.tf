module "kms_keyring" {
  source           = "../../../../modules/kms"
  project_id       = var.project_id
  env              = var.env
}

module "kms_keyring_as2" {
  source           = "../../../../modules/kms"
  project_id       = var.project_id
  env              = var.env
  region_code      = "as2"
  keyring_location = "asia-south2"
}