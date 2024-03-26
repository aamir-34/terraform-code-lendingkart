module "postgres_db_02" {
  source              = "../../../../../../modules/cloudsql/postgres"
  region              = var.region
  project_id          = var.project_id
  user_labels         = var.labels
  db_num              = "02"
  env                 = var.env
  kms_crypto_key_name = var.kms_crypto_key_as1
  db_type             = "postgres"
  engine_type         = "POSTGRES"
  database_version    = "POSTGRES_15"
  disk_size           = "200"
  zone                = "asia-south1-a"
  pricing_plan        = "PER_USE"
  tier                = "db-custom-2-4096"
}
