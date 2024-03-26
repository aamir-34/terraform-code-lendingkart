resource "google_container_node_pool" "node_pools" {
  for_each          = var.node_pool
  cluster           = var.gke_cluster_name
  location          = var.location
  project           = var.project_id
  name              = each.key
  node_count        = each.value.node_count
  version           = each.value.node_version
  max_pods_per_node = var.max_pods_per_node
  node_locations    = each.value.node_locations 

  autoscaling {
    max_node_count = each.value.max_node_count
    min_node_count = each.value.min_node_count
  }

  management {
    auto_repair  = each.value.auto_repair
    auto_upgrade = each.value.auto_upgrade
  }

  node_config {
    disk_size_gb      = each.value.disk_size_gb
    disk_type         = each.value.disk_type
    boot_disk_kms_key = var.kms_crypto_key_name
    image_type        = each.value.image_type
    local_ssd_count   = each.value.local_ssd_count
    machine_type      = each.value.machine_type
    oauth_scopes      = each.value.oauth_scopes
    service_account   = "${var.org}-sa-${var.env}-gke@${var.project_id}.iam.gserviceaccount.com"
    spot              = each.value.spot
    labels            = var.labels

    shielded_instance_config {
      enable_integrity_monitoring = each.value.enable_integrity_monitoring
      enable_secure_boot          = each.value.enable_secure_boot
    }
  }

  upgrade_settings {
    max_surge       = each.value.max_surge
    max_unavailable = each.value.max_unavailable
  }

  lifecycle {
    ignore_changes        = [node_count]
    create_before_destroy = true
  }
}