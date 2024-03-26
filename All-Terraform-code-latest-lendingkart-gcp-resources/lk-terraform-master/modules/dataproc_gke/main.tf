resource "google_dataproc_cluster" "dataproc_gke_cluster" {
  name                          = "${var.org}-dataproc-cluster-${var.env}-${var.region_code}"
  region                        = var.region
  graceful_decommission_timeout = var.decommission_timeout

 /* cluster_config {
    gce_cluster_config {
      service_account = "${var.org}-sa-${var.env}-${var.app_name}@lk-dev-apps.iam.gserviceaccount.com"
      service_account_scopes = [ 
        "cloud-platform"
       ]
      
    }  
  }
*/
  virtual_cluster_config {
    staging_bucket = var.staging_bucket

    kubernetes_cluster_config {
      kubernetes_namespace = var.kubernetes_namespace

      kubernetes_software_config {
        component_version = {
          "SPARK" : var.spark_version
        }

        properties = {
          "spark:spark.eventLog.enabled" : "true",
          "dataproc:dataproc.gke.agent.google-service-account": "dataproc-agent@lk-dev-apps.iam.gserviceaccount.com",
          "dataproc:dataproc.gke.spark.driver.google-service-account": "dataproc-agent@lk-dev-apps.iam.gserviceaccount.com",
          "dataproc:dataproc.gke.spark.executor.google-service-account": "dataproc-agent@lk-dev-apps.iam.gserviceaccount.com"

        }
      }

      gke_cluster_config {
        gke_cluster_target = "projects/${var.org}-${var.env}-apps/locations/${var.region}/clusters/${var.org}-gke-${var.env}-${var.region_code}"
        node_pool_target {
          node_pool = "${var.org}-dataproc-np-${var.env}-az1a"
          roles     = ["DEFAULT", "CONTROLLER", "SPARK_DRIVER", "SPARK_EXECUTOR" ]

          node_pool_config {
            locations = var.node_pool_locations
            autoscaling {
              min_node_count = var.min_node_count
              max_node_count = var.max_node_count
            }

            config {
              machine_type     = var.machine_type
              preemptible      = var.preemptible
              local_ssd_count  = var.local_ssd_count
              min_cpu_platform = var.min_cpu_platform
            }
          }
        }
      }
    }
  }
}


