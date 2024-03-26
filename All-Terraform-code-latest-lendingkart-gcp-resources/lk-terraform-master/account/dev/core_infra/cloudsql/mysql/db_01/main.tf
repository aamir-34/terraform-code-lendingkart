module "mysql_db_01" {
  source                      = "../../../../../../modules/cloudsql/mysql"
  region                      = var.region
  project_id                  = var.project_id
  user_labels                 = var.labels
  db_num                      = "01"
  env                         = var.env
  kms_crypto_key_name         = var.kms_crypto_key_as1
  db_type                     = "mysql"
  engine_type                 = "MYSQL"
  database_version            = "MYSQL_8_0"
  disk_size                   = "50"
  zone                        = "asia-south1-a"
  pricing_plan                = "PER_USE"
  tier                        = "db-custom-2-4096"
  password_length             = 25
  password_digits             = true
  password_special            = true
  password_uppercase          = true
  enable_private_path_for_gcp = true
  authorized_networks = [
    {
       name = "AWS_QA_VPC_CIDR"
       value = "162.20.0.0/16"
     }
   ]
}