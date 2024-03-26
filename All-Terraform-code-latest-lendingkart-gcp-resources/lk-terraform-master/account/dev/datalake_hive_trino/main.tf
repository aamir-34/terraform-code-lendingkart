module "datalake_cluster_hive_trino" {
  source       = "../../../modules/dataproc_hive_trino_cluster"
  org          = var.org
  env          = var.env
  region_code  = var.region_code
  region       = var.region
  project_id   = var.project_id
  app_name     = var.appname
  num_workers  = 2
  num_master   = 1
  machine_type = "n2-standard-4"
  dataproc_cluster = {
    trino_cluster = {
      use_case                 = "trino-"
      num_count                = 01
      image_version            = "2.2-debian12"
      dataproc_master_bootdisk = "200"
      dataproc_worker_bootdisk = "200"
      override_properties = {
        "dataproc:dataproc.allow.zero.workers"              = "true"
        "dataproc:jupyter.scala_version"                    = "2.12"         ### Use Scala version 2.12.18
        "dataproc:jupyter.kernel.conda.packages"            = "hadoop=3.3.6" ### Use Hadoop version 3.3.6
        "dataproc:jupyter.kernel.conda.packages"            = "java-11.0.20.1"
        "dataproc:trino-catalog.default.connector.name"     = "hive"           ### Trino catalog connector name
        "dataproc:trino-catalog.default.hive.metastore.uri" = "localhost:9000" ### Hive metastore URI 
      }
    },
    hive_cluster_1 = {
      use_case                 = ""
      num_count                = 01
      image_version            = "2.2-debian12"
      dataproc_master_bootdisk = "200"
      dataproc_worker_bootdisk = "200"
      override_properties = {
        "hive:hive.metastore.warehouse.dir" = "gs://dataproc-hive-bucket/hive1/warehouse"
      }
    },
    hive_cluster_2 = {
      use_case                 = ""
      num_count                = 02
      image_version            = "2.2-debian12"
      dataproc_master_bootdisk = "200"
      dataproc_worker_bootdisk = "200"
      override_properties = {
        "hive:hive.metastore.warehouse.dir" = "gs://dataproc-hive-bucket/hive2/warehouse"
      }
    }
  }
}
