module "postgres_db_01" {
  source              = "../../../../../../modules/cloudsql"
  region              = var.region
  project_id          = var.project_id
  user_labels         = var.labels
  db_num              = "01"
  env                 = var.env
  kms_crypto_key_name = var.kms_crypto_key_as1
  db_type             = "postgres"
  engine_type         = "POSTGRES"
  database_version    = "POSTGRES_14"
  disk_size           = "50"
  zone                = "asia-south1-a"
  pricing_plan        = "PER_USE"
  tier                = "db-custom-2-4096"
}