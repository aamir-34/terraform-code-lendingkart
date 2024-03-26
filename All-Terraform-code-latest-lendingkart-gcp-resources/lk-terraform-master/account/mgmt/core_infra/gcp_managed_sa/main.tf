module "compute_engine_svc_agent" {
  source                  = "../../../../modules/member_iam"
  project_id              = var.project_id
  prefix                  = var.prefix
  project_roles           = [ "roles/cloudkms.cryptoKeyEncrypterDecrypter" ]
  service_account_address = "service-84029686633@compute-system.iam.gserviceaccount.com"
}

module "gke_bkp_svc_account" {
  source                  = "../../../../modules/member_iam"
  project_id              = var.project_id
  prefix                  = var.prefix
  project_roles           = [ "roles/cloudkms.cryptoKeyEncrypterDecrypter" ]
  service_account_address = "service-84029686633@gcp-sa-gkebackup.iam.gserviceaccount.com"
}

module "gcs_svc_account" {
  source                  = "../../../../modules/member_iam"
  project_id              = var.project_id
  prefix                  = var.prefix
  project_roles           = [ "roles/cloudkms.cryptoKeyEncrypterDecrypter" ]
  service_account_address = "service-84029686633@gs-project-accounts.iam.gserviceaccount.com"
}

module "kubernetes_engine_service_agent" {
  source                  = "../../../../modules/member_iam"
  project_id              = var.project_id
  prefix                  = var.prefix
  project_roles           = [ "roles/cloudkms.cryptoKeyEncrypterDecrypter" ]
  service_account_address = "service-84029686633@container-engine-robot.iam.gserviceaccount.com"
}

module "compute_engine_svc_agent_01" {
  source                  = "../../../../modules/member_iam"
  project_id              = var.project_id
  prefix                  = var.prefix
  project_roles           = [ "roles/cloudkms.cryptoKeyEncrypterDecrypter" ]
  service_account_address = "service-108166408114@compute-system.iam.gserviceaccount.com"
}

module "cloud_sql_srv_account" {
  source                  = "../../../../modules/member_iam"
  project_id              = var.project_id
  prefix                  = var.prefix
  project_roles           = [ "roles/cloudkms.cryptoKeyEncrypterDecrypter" ]
  service_account_address = "service-84029686633@gcp-sa-cloud-sql.iam.gserviceaccount.com"
}