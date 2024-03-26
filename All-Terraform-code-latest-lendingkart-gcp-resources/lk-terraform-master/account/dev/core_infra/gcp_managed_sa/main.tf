module "compute_engine_svc_agent" {
  source                  = "../../../../modules/member_iam"
  project_id              = var.project_id
  prefix                  = var.prefix
  project_roles           = [ "roles/cloudkms.cryptoKeyEncrypterDecrypter" ]
  service_account_address = "service-388309193905@compute-system.iam.gserviceaccount.com"
}

module "gke_bkp_svc_account" {
  source                  = "../../../../modules/member_iam"
  project_id              = var.project_id
  prefix                  = var.prefix
  project_roles           = [ "roles/cloudkms.cryptoKeyEncrypterDecrypter" ]
  service_account_address = "service-388309193905@gcp-sa-gkebackup.iam.gserviceaccount.com"
}

module "gcs_svc_account" {
  source                  = "../../../../modules/member_iam"
  project_id              = var.project_id
  prefix                  = var.prefix
  project_roles           = [ "roles/cloudkms.cryptoKeyEncrypterDecrypter" ]
  service_account_address = "service-388309193905@gs-project-accounts.iam.gserviceaccount.com"
}

module "kubernetes_engine_service_agent" {
  source                  = "../../../../modules/member_iam"
  project_id              = var.project_id
  prefix                  = var.prefix
  project_roles           = [ "roles/cloudkms.cryptoKeyEncrypterDecrypter" ]
  service_account_address = "service-388309193905@container-engine-robot.iam.gserviceaccount.com"
}

module "cloud_sql_srv_account" {
  source                  = "../../../../modules/member_iam"
  project_id              = var.project_id
  prefix                  = var.prefix
  project_roles           = [ "roles/cloudkms.cryptoKeyEncrypterDecrypter" ]
  service_account_address = "service-388309193905@gcp-sa-cloud-sql.iam.gserviceaccount.com"
}