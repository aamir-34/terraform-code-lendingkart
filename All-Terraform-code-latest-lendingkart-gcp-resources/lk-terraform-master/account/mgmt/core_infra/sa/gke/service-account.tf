module "service-account" {
  source          = "../../../../../modules/service_account"
  description     = "Service Account for GKE node pool"
  project_id      = var.project_id
  org             = var.org
  env             = var.env
  app_name        = var.app_name
}
module "member_roles" {
  source                     = "../../../../../modules/member_iam"
  service_account_address    = module.service-account.service_account_email 
  project_id                 = var.project_id
  project_roles              = ["roles/storage.admin", "roles/cloudkms.cryptoKeyEncrypterDecrypter","roles/monitoring.viewer", "roles/monitoring.metricWriter", "roles/logging.logWriter", "roles/stackdriver.resourceMetadata.writer"]
  prefix                     = "serviceAccount"      
}