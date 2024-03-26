#module "dataproc_gke_cluster" {
#  source               = "../../../../modules/dataproc"
#  org                  = var.org
#  env                  = var.env
#  region_code          = var.region_code
#  region               = var.region
#  project_id           = var.project_id
#  app_name             = "dataproc"
#  staging_bucket       = "lk-bucket-dataproc"
#  kubernetes_namespace = "default"
#  min_node_count       = "1"
#  max_node_count       = "2"
#  machine_type         = "n2-standard-4"
#  preemptible          = true
#  min_cpu_platform     = "cascadelake"
#  spark_version        = "3.1-dataproc-13"
#}
