module "datalake_cluster" {
  source = "../../../modules/dataproc"
  org                    = var.org
  env                    = var.env
  region_code            = var.region_code
  region                 = var.region
  project_id             = var.project_id
  app_name               = var.appname
  staging_bucket         = module.gcs_datalake.gcs_name
  machine_type           = "n2-standard-4"
  num_workers            = 2
  image_version          = "2.2-debian12"
  service_account        = module.service-account.service_account_email
  dataproc_metastore     = "projects/lk-dev-apps/locations/asia-south1/services/data-engg-metastore"
  service_account_scopes = ["useraccounts-ro", "storage-rw", "logging-write", "cloud-platform"]
}