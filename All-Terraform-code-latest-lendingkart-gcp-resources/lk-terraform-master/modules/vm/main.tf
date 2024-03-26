resource "google_compute_instance" "vm-instance" {
    boot_disk {
    initialize_params {
      image = var.image
      type = var.disk_type
      size = var.size
    }  
    kms_key_self_link = var.kms_crypto_key_name
}
  can_ip_forward      = var.can_ip_forward
  deletion_protection = var.deletion_protection
  enable_display      = var.enable_display
  labels              = merge(var.labels)
  zone                = var.zone
  machine_type        = var.machine_type
  name                = "${var.org}-${var.use_case}-${var.env}-${var.vm_num}"
  network_interface {
   // access_config {    // If we specify access config then the external IP address will be displayed otherwise not
   // }
  network            = "${var.org}-vpc-${var.env}"
  queue_count        = var.queue_count
  stack_type         = var.stack_type
  subnetwork         = "${var.org}-subnet-${var.env}-app-${var.region_code}"
  subnetwork_project = var.project_id
  }
  project            = var.project_id
  reservation_affinity {
    type = "ANY_RESERVATION"
  }

  scheduling {
    on_host_maintenance = var.on_host_maintenance
    min_node_cpus       = var.min_node_cpus
    automatic_restart   = var.preemptible ? "false" : "true"
    preemptible         = var.preemptible
  }
  service_account {
    email  = var.email
    scopes = var.scopes
  }
  metadata = {
  }
  tags = var.tags
}