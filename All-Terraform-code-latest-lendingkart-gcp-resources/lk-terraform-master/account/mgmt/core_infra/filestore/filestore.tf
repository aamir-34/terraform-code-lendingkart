module "filestore" {
  source              = "../../../../modules/filestore/instance"
  project_id          = var.project_id
  kms_crypto_key_name = var.kms_crypto_key_name
  location            = var.location
  labels              = var.labels
  org                 = var.org
  env                 = var.env
  tier                = "ENTERPRISE"
  capacity_gb         = "1024"
  fs_name             = "lkfs"
}
