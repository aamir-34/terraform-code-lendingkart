resource "vault_generic_secret" "application" {
  path = var.application_path
  data_json = <<EOT
{
}
EOT
  lifecycle {
    ignore_changes = [
      data_json
    ]
  }
}