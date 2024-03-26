module "service-account" {
  source          = "../../../modules/service_account"
  description     = "Service Account for ${var.appname}"
  project_id      = var.project_id
  org             = var.org
  env             = var.env
  app_name        = var.appname
}

module "member_roles" {
  source                     = "../../../modules/member_iam"
  service_account_address    = module.service-account.service_account_email
  project_id                 = var.project_id
  project_roles              = [ "roles/storage.objectAdmin","roles/cloudkms.cryptoKeyEncrypterDecrypter","roles/dataproc.worker","roles/compute.admin" ]
  prefix                     = "serviceAccount"
}