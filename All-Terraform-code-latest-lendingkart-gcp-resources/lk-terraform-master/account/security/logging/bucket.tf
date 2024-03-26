module "gcs_aggregated_logs" {
  source                      = "../../../modules/gcs"
  project_id                  = var.project_id
  location                    = "asia-south1"
  versioning                  = true
  storage_class               = "STANDARD"
  autoclass                   = false
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
  force_destroy               = false
  labels                      = var.labels
  org                         = var.org
  env                         = var.env
  use_case                    = "aggregated-logs"  

  encryption = {
    default_kms_key_name = var.kms_crypto_key_as1
  }

}

module "gcs_audit" {
  source                      = "../../../modules/gcs"
  project_id                  = var.project_id
  location                    = "asia-south1"
  versioning                  = true
  storage_class               = "STANDARD"
  autoclass                   = false
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
  force_destroy               = false
  labels                      = var.labels
  org                         = var.org
  env                         = var.env
  use_case                    = "audit"    

  encryption = {
    default_kms_key_name = var.kms_crypto_key_as1
  } 

}