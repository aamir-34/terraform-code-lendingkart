module "gcs_datalake" {
  source                      = "../../../modules/gcs"
  project_id                     = var.project_id
  location                    = "asia-south1"
  storage_class               = "STANDARD"
  autoclass                   = false
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
  force_destroy               = false
  labels                      = var.labels
  org                         = var.org
  env                         = var.env
  use_case                    = "datalake"
  encryption = {
    default_kms_key_name = var.kms_crypto_key_as1
  }
}

module "gcs_staging" {
  source                      = "../../../modules/gcs"
  project_id                     = var.project_id
  location                    = "asia-south1"
  storage_class               = "STANDARD"
  autoclass                   = false
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
  force_destroy               = false
  labels                      = var.labels
  org                         = var.org
  env                         = var.env
  use_case                    = "staging"

  encryption = {
    default_kms_key_name = var.kms_crypto_key_as1
  }
}

module "gcs_transactions" {
  source                      = "../../../modules/gcs"
  project_id                     = var.project_id
  location                    = "asia-south1"
  storage_class               = "STANDARD"
  autoclass                   = false
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
  force_destroy               = false
  labels                      = var.labels
  org                         = var.org
  env                         = var.env
  use_case                    = "transactions"

  encryption = {
    default_kms_key_name = var.kms_crypto_key_as1
  }
}

module "gcs_analytics" {
  source                      = "../../../modules/gcs"
  project_id                     = var.project_id
  location                    = "asia-south1"
  storage_class               = "STANDARD"
  autoclass                   = false
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
  force_destroy               = false
  labels                      = var.labels
  org                         = var.org
  env                         = var.env
  use_case                    = "analytics"

  encryption = {
    default_kms_key_name = var.kms_crypto_key_as1
  }
}
