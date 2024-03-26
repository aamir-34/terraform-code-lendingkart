resource "google_gke_backup_backup_plan" "gke_bkp_plan" {
   name         = "${var.org}-gke-bkp-${var.env}-${var.region_code}"
   cluster      = "projects/${var.project_id}/locations/${var.region}/clusters/${var.org}-gke-${var.env}-${var.region_code}"
   location     = var.backup_location
   description  = var.description
   retention_policy {
     backup_retain_days = var.bkp_retain_days
     backup_delete_lock_days = var.bkp_delete_lock_days
     locked                  = true
   }
   backup_schedule {
     cron_schedule = var.cron_schedule
   }
   backup_config {
     include_volume_data = true
     include_secrets = true
     all_namespaces = true
     encryption_key {
       gcp_kms_encryption_key = var.kms_encryption_key
     }
   }
   deactivated = true
}