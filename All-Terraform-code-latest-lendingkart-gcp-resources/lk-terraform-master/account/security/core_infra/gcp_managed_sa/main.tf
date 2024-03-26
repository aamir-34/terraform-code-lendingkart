module "gcs_svc_account" {
  source                  = "../../../../modules/member_iam"
  project_id              = var.project_id
  prefix                  = var.prefix
  project_roles           = [ "roles/cloudkms.cryptoKeyEncrypterDecrypter" ]
  service_account_address = "service-345109160761@gs-project-accounts.iam.gserviceaccount.com"
}