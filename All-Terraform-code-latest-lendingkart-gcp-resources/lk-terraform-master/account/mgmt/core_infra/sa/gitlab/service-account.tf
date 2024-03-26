module "service-account" {
  source          = "../../../../../modules/service_account"
  description     = "Gitlab access"
  project_id      = var.project_id
  org             = var.org
  env             = var.env
  app_name        = var.app_name
}

resource "google_service_account_key" "sa_key" {
  service_account_id = module.service-account.service_account_name
}

module "mgmt_member_roles" {
  source                     = "../../../../../modules/member_iam"
  service_account_address    = module.service-account.service_account_email
  project_id                 = var.project_id
  project_roles              = ["roles/container.admin", "roles/storage.objectUser", "roles/artifactregistry.writer"]
  prefix                     = "serviceAccount"
}

module "prod_member_roles" {
  source                     = "../../../../../modules/member_iam"
  service_account_address    = module.service-account.service_account_email
  project_id                 = "lk-prod-apps"
  project_roles              = ["roles/container.admin"]
  prefix                     = "serviceAccount"
}

module "preprod_member_roles" {
  source                     = "../../../../../modules/member_iam"
  service_account_address    = module.service-account.service_account_email
  project_id                 = "lk-preprod-apps"
  project_roles              = ["roles/container.admin"]
  prefix                     = "serviceAccount"
}

module "qa_member_roles" {
  source                     = "../../../../../modules/member_iam"
  service_account_address    = module.service-account.service_account_email
  project_id                 = "lk-qa-apps"
  project_roles              = ["roles/container.admin"]
  prefix                     = "serviceAccount"
}

module "dev_member_roles" {
  source                     = "../../../../../modules/member_iam"
  service_account_address    = module.service-account.service_account_email
  project_id                 = "lk-dev-apps"
  project_roles              = ["roles/container.admin"]
  prefix                     = "serviceAccount"
}