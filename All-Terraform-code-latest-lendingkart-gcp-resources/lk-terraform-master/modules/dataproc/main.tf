resource "google_dataproc_cluster" "dataproc_cluster" {
  name    =  "${var.org}-${var.app_name}-cluster-${var.env}-${var.region_code}"
  region  = var.region
  cluster_config {
    staging_bucket = var.staging_bucket
    metastore_config {
    dataproc_metastore_service = var.dataproc_metastore
  }

    master_config {
      machine_type = var.machine_type
      disk_config {
        boot_disk_type    = var.boot_disk_type
        boot_disk_size_gb = var.dataproc_master_bootdisk
      }
    }

    worker_config {
      machine_type  = var.machine_type
      num_instances = var.num_workers
      disk_config {
        boot_disk_type    = var.boot_disk_type
        boot_disk_size_gb = var.dataproc_worker_bootdisk
      }
    }

    software_config {
      image_version = var.image_version
    }

    gce_cluster_config {
      internal_ip_only       = true
      subnetwork             = "projects/lk-dev-apps/regions/asia-south1/subnetworks/lk-subnet-dev-db-as1"

      service_account       = var.service_account
      service_account_scopes = var.service_account_scopes
    }
  }
}
