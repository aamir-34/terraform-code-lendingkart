module "service_account" {
  source      = "../../../modules/service_account"
  description = "Service Account for ${var.app_name}"
  project_id  = var.project_id
  org         = var.org
  env         = var.env
  app_name    = var.app_name
}

module "member_roles" {
  source                  = "../../../modules/member_iam"
  service_account_address = module.service_account.service_account_email
  project_id              = var.project_id
  project_roles           = ["roles/iam.workloadIdentityUser", "roles/storage.objectAdmin", "roles/artifactregistry.reader", "roles/artifactregistry.writer", "roles/compute.admin", "roles/iam.serviceAccountUser", "roles/compute.instanceAdmin.v1"]
  prefix                  = "serviceAccount"
}

module "workload_identity" {
  source                = "../../../modules/workload_identity"
  ksa_name              = var.app_name
  namespace             = var.namespace
  project_id            = var.project_id
  service_account_email = module.service_account.service_account_name
}