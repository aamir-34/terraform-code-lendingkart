module "service-account" {
  source          = "../../../modules/service_account"
  description     = "Service Account for ${var.appname}"
  project_id      = var.project_id
  org             = var.org
  env             = var.env
  app_name        = var.appname
}

resource "google_service_account_key" "sa_key" {
  service_account_id = module.service-account.service_account_name
}

#resource "local_file" "service_account" {
#    content  = base64decode(google_service_account_key.sa_key.private_key)
#    filename = "./serviceaccount.json"
#}

module "member_roles" {
  source                     = "../../../modules/member_iam"
  service_account_address    = module.service-account.service_account_email
  project_id                 = var.project_id
  project_roles              = ["roles/storage.objectUser"]
  prefix                     = "serviceAccount"
}

module "workload_identity" {
  source = "../../../modules/workload_identity"
  ksa_name = var.appname
  namespace = var.appname
  project_id = var.project_id
  service_account_email = module.service-account.service_account_name
}