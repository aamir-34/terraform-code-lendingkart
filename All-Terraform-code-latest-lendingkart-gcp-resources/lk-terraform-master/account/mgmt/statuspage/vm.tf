module "statuspage_vm" {
  source              = "../../../modules/vm"
  project_id          = var.project_id
  region_code         = var.region_code
  org                 = var.org
  env                 = var.env
  use_case            = "statuspage-svc"
  kms_crypto_key_name = var.kms_crypto_key_as1
  zone                = "asia-south1-a"
  labels              = var.labels
  image               = "debian-10-buster-v20240312"
  machine_type        = "n1-standard-1"
  email               = module.service-account.service_account_email
  size                = "100"
  disk_type           = "pd-balanced"
}