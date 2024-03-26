resource "google_gke_backup_restore_plan" "restore_plan" {
  name        = "${var.org}-gke-restore-${var.env}-${var.dr_region_code}"
  location    = var.plan_location
  backup_plan = "projects/${var.org}-${var.env}-apps/locations/${var.plan_location}/backupPlans/${var.org}-gke-bkp-${var.env}-${var.region_code}"
  cluster     = "projects/${var.org}-${var.env}-apps/locations/${var.plan_location}/clusters/${var.org}-gke-${var.env}-${var.dr_region_code}"

  restore_config {
    all_namespaces                   = var.all_namespaces
    namespaced_resource_restore_mode = var.namespaced_resource_restore_mode
    volume_data_restore_policy       = var.volume_data_restore_policy

    cluster_resource_restore_scope {
      all_group_kinds = var.all_group_kinds
    }

    cluster_resource_conflict_policy = var.cluster_resource_conflict_policy
  }
}

