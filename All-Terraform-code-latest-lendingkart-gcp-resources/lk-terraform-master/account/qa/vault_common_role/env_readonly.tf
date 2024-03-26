resource "vault_policy" "all_read_policy" {
  name = "${var.env}_vault_readonly"

  policy = <<EOT
  # List key/value credentials
  path "credentials/*"
  {
    capabilities = ["list"]
  }
  # List, read key/value
  path "credentials/${var.env}/*" {
    capabilities = ["read", "list"]
  }
  path "credentials/data/${var.env}/*" {
    capabilities = ["read", "list"]
  }
  path "credentials/metadata/${var.env}/*" {
    capabilities = ["read", "list"]
  }

  # List key/value parameters
  path "parameters/*"
  {
    capabilities = ["list"]
  }
  # List, read key/value
  path "parameters/${var.env}/*" {
    capabilities = ["read", "list"]
  }
  path "parameters/data/${var.env}/*" {
    capabilities = ["read", "list"]
  }
  path "parameters/metadata/${var.env}/*" {
    capabilities = ["read", "list"]
  }
EOT
}
