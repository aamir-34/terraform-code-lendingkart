module "gcs" {
  source                      = "../../../modules/gcs"
  project_id                  = var.project_id
  location                    = "asia-south1"
  storage_class               = "STANDARD"
  autoclass                   = false
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
  force_destroy               = false
  labels                      = var.labels
  org                         = var.org
  env                         = var.env
  use_case                    = var.use_case

  encryption = {
    default_kms_key_name = var.kms_crypto_key_as1
  }
  
  lifecycle_rules = [
    {
      action = {
        type          = "Delete"
      }
      condition = {
        age = 30
      }
    }
  ]

}