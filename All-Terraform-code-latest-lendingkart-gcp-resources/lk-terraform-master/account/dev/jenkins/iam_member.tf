module "member_roles" {
  source                  = "../../../modules/member_iam"
  service_account_address = "lk-sa-mgmt-jenkins@lk-mgmt-apps.iam.gserviceaccount.com"
  project_id              = var.project_id
  project_roles           = ["roles/container.admin"]
  prefix                  = "serviceAccount"
}
