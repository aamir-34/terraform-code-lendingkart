module "kms_key_as1" {
  source           = "../../../../modules/kms"
  keyring_location = "asia-south1"
  project_id       = var.project_id
  org              = var.org
  env              = var.env
  region_code      = var.region_code
}

module "kms_keyring_as2" {
  source           = "../../../../modules/kms"
  keyring_location = "asia-south2"
  project_id       = var.project_id
  org              = var.org
  env              = var.env
  region_code      = "as2"
}
