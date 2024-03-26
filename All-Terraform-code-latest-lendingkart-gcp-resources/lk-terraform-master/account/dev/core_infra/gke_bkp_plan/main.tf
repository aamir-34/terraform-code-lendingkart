/*
module "gke_bkp_plan" {
  source = "../../../../modules/gke/bkp_plan"
  description = "'${var.env}' GKE Cluster Backup-Plan at Delhi Region"
  project_id = var.project_id
  bkp_retain_days = "5"
  bkp_delete_lock_days = "3"
  cron_schedule = "00 14 * * *"
  env = var.env
  region = var.region
  backup_location = var.backup_location
  kms_encryption_key = var.kms_crypto_key_as2
}
*/