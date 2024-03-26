module "compute_engine_svc_agent" {
  source                  = "../../../../modules/member_iam"
  project_id              = var.project_id
  prefix                  = var.prefix
  project_roles           = ["roles/cloudkms.cryptoKeyEncrypterDecrypter"]
  service_account_address = "service-58735815672@compute-system.iam.gserviceaccount.com"
}

module "kubernetes_engine_service_agent" {
  source                  = "../../../../modules/member_iam"
  project_id              = var.project_id
  prefix                  = var.prefix
  project_roles           = ["roles/cloudkms.cryptoKeyEncrypterDecrypter"]
  service_account_address = "service-58735815672@container-engine-robot.iam.gserviceaccount.com"
}

module "gcs_svc_account" {
  source                  = "../../../../modules/member_iam"
  project_id              = var.project_id
  prefix                  = var.prefix
  project_roles           = [ "roles/cloudkms.cryptoKeyEncrypterDecrypter" ]
  service_account_address = "service-58735815672@gs-project-accounts.iam.gserviceaccount.com"
}