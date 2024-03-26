resource "google_dataproc_cluster" "dataproc_cluster" {
  for_each          = var.dataproc_cluster
  name              = "${var.app_name}-cluster-${each.value.use_case}${var.env}-${each.value.num_count}"
  region            = var.region
  labels            = var.labels 
  cluster_config {
    gce_cluster_config{
      internal_ip_only   = true
      subnetwork         = "projects/${var.org}-${var.env}-apps/regions/${var.region}/subnetworks/${var.org}-subnet-${var.env}-db-${var.region_code}"
      service_account    = "${var.org}-sa-${var.env}-datalake@${var.org}-${var.env}-apps.iam.gserviceaccount.com"
    }

    master_config {
      machine_type  = var.machine_type
      num_instances = var.num_master
      disk_config {
        boot_disk_type    = var.boot_disk_type
        boot_disk_size_gb = each.value.dataproc_master_bootdisk
      }
    }

    worker_config {
      machine_type  = var.machine_type
      num_instances = var.num_workers
      disk_config {
        boot_disk_type    = var.boot_disk_type
        boot_disk_size_gb = each.value.dataproc_worker_bootdisk
      }
    }

    software_config {
      image_version       = each.value.image_version
      override_properties = each.value.override_properties
      
    }
  }
}









 # override_properties = {
      #   "dataproc:dataproc.allow.zero.workers"   = "true"
      #   "dataproc:jupyter.scala_version"         = "2.12"         ### Use Scala version 2.12.18
      #   "dataproc:jupyter.kernel.conda.packages" = "hadoop=3.3.6" ### Use Hadoop version 3.3.6
      #   "dataproc:jupyter.kernel.conda.packages" = "java-11.0.20.1"
      #   "dataproc:trino-catalog.default.connector.name" = "hive" ### Trino catalog connector name
      #   "dataproc:trino-catalog.default.hive.metastore.uri" = "localhost:9000" ### Hive metastore URI
      # }

# resource "google_dataproc_cluster" "hive_cluster_1" {
#   name    = "${var.org}-${var.app_name}-cluster-${var.env}-${var.region_code}"
#   region  = var.region
#   cluster_config {
#     master_config {
#        machine_type = var.machine_type
#       num_instances = var.num_master
#       disk_config {
#         boot_disk_type    = var.boot_disk_type
#         boot_disk_size_gb = var.dataproc_master_bootdisk
#       }
#     }
    
#     worker_config {
#       machine_type  = var.machine_type
#       num_instances = var.num_workers
#       disk_config {
#         boot_disk_type    = var.boot_disk_type
#         boot_disk_size_gb = var.dataproc_worker_bootdisk
#       }
#     }
#     software_config {
#       image_version = var.image_version # Use DataProc cluster image version 2.2.6-debian12
#       override_properties = {
#         "hive:hive.metastore.warehouse.dir" = "gs://dataproc-hive-bucket/hive1/warehouse"
#       }

#     }
#   }
# }

# resource "google_dataproc_cluster" "hive_cluster_2" {
#   name    = "${var.org}-${var.app_name}-cluster-${var.env}-${var.region_code}"
#   region  = var.region
#   cluster_config {
#     master_config {
#        machine_type = var.machine_type
#       num_instances = var.num_master
#       disk_config {
#         boot_disk_type    = var.boot_disk_type
#         boot_disk_size_gb = var.dataproc_master_bootdisk
#       }
#     }
    
#     worker_config {
#       machine_type  = var.machine_type
#       num_instances = var.num_workers
#       disk_config {
#         boot_disk_type    = var.boot_disk_type
#         boot_disk_size_gb = var.dataproc_worker_bootdisk
#       }
#     }
#     software_config {
#       image_version = var.image_version # Use DataProc cluster image version 2.2.6-debian12
#       override_properties = {
#         "hive:hive.metastore.warehouse.dir" = "gs://dataproc-hive-bucket/hive2/warehouse"
#       }

#     }
#   }
# }
