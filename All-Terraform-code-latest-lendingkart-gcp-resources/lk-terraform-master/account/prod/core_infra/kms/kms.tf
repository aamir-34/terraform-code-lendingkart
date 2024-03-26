module "kms_keyring" {
  source           = "../../../../modules/kms"
  project_id       = var.project_id
  env              = var.env
}
