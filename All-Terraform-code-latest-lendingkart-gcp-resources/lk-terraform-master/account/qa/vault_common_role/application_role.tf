module "vault_application_role" {
  source = "../../../modules/vault/application_role"
  auth_name = var.auth_name
  service_accounts = var.service_accounts
}