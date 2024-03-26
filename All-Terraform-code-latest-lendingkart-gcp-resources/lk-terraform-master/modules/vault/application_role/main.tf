
resource "vault_kubernetes_auth_backend_role" "example" {
  backend                          = var.auth_name
  role_name                        = "applications"
  bound_service_account_names      = var.service_accounts
  bound_service_account_namespaces = ["*"]
  token_ttl                        = 300
  token_policies                   = ["applications"]
}