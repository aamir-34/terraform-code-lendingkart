resource "vault_policy" "all_write_policy" {
  count = var.permission == "write" ? 1 : 0
  name = "${var.env}_${var.application}_${var.identity_group}"

  policy = <<EOT
# List key/value credentials
path "credentials/*"
{
  capabilities = ["list"]
}
# List, read, create and update key/value
path "credentials/${var.env}/${var.application}/*" {
  capabilities = ["update", "read", "list", "create"]
}
path "credentials/data/${var.env}/${var.application}/*" {
  capabilities = ["update", "read", "list", "create"]
}
path "credentials/metadata/${var.env}/${var.application}/*" {
  capabilities = ["update", "read", "list", "create"]
}

# List key/value parameters
path "parameters/*"
{
  capabilities = ["list"]
}
# List, read, create and update key/value
path "parameters/${var.env}/${var.application}/*" {
  capabilities = ["update", "read", "list", "create"]
}
path "parameters/data/${var.env}/${var.application}/*" {
  capabilities = ["update", "read", "list", "create"]
}
path "parameters/metadata/${var.env}/${var.application}/*" {
  capabilities = ["update", "read", "list", "create"]
}

EOT
}

resource "vault_policy" "all_read_policy" {
  count = var.permission == "read" ? 1 : 0
  name = "${var.env}_${var.application}_${var.identity_group}"

  policy = <<EOT
# List key/value credentials
path "credentials/*"
{
  capabilities = ["list"]
}
# List, read, create and update key/value
path "credentials/${var.env}/${var.application}/*" {
  capabilities = [ "read", "list"]
}
path "credentials/data/${var.env}/${var.application}/*" {
  capabilities = ["read", "list"]
}
path "credentials/metadata/${var.env}/${var.application}/*" {
  capabilities = ["read", "list"]
}

# List key/value parameters
path "parameters/*"
{
  capabilities = ["list"]
}
# List, read, create and update key/value
path "parameters/${var.env}/${var.application}/*" {
  capabilities = ["read", "list"]
}
path "parameters/data/${var.env}/${var.application}/*" {
  capabilities = ["read", "list"]
}
path "parameters/metadata/${var.env}/${var.application}/*" {
  capabilities = [ "read", "list"]
}

EOT
}

# resource "vault_policy" "credentials_write_policy" {
#   count = var.permission == "credentials_write" ? 1 : 0
#   name = "${var.env}_${var.application}_${var.identity_group}"

#   policy = <<EOT
# # List key/value credentials
# path "credentials/*"
# {
#   capabilities = ["list"]
# }
# # List, read, create and update key/value
# path "credentials/${var.env}/${var.application}/*" {
#   capabilities = ["update", "read", "list", "create"]
# }
# path "credentials/data/${var.env}/${var.application}" {
#   capabilities = ["update", "read", "list", "create"]
# }
# path "credentials/metadata/${var.env}/${var.application}" {
#   capabilities = ["update", "read", "list", "create"]
# }

# # List key/value parameters
# path "parameters/*"
# {
#   capabilities = ["list"]
# }
# # List, read, create and update key/value
# path "parameters/${var.env}/${var.application}/*" {
#   capabilities = ["read", "list"]
# }
# path "parameters/data/${var.env}/${var.application}" {
#   capabilities = ["read", "list"]
# }
# path "parameters/metadata/${var.env}/${var.application}" {
#   capabilities = ["read", "list"]
# }

# EOT
# }

# resource "vault_policy" "parameters_write_policy" {
#   count = var.permission == "parameters_write" ? 1 : 0
#   name = "${var.env}_${var.application}_${var.identity_group}"

#   policy = <<EOT
# # List key/value credentials
# path "credentials/*"
# {
#   capabilities = ["list"]
# }
# # List, read, create and update key/value
# path "credentials/${var.env}/${var.application}/*" {
#   capabilities = ["read", "list"]
# }
# path "credentials/data/${var.env}/${var.application}" {
#   capabilities = ["read", "list"]
# }
# path "credentials/metadata/${var.env}/${var.application}" {
#   capabilities = ["read", "list"]
# }

# # List key/value parameters
# path "parameters/*"
# {
#   capabilities = ["list"]
# }
# # List, read, create and update key/value
# path "parameters/${var.env}/${var.application}/*" {
#   capabilities = ["update", "read", "list", "create"]
# }
# path "parameters/data/${var.env}/${var.application}" {
#   capabilities = ["update", "read", "list", "create"]
# }
# path "parameters/metadata/${var.env}/${var.application}" {
#   capabilities = ["update", "read", "list", "create"]
# }

# EOT
# }

resource "vault_policy" "parameters_read_policy" {
  count = var.permission == "parameters_read" ? 1 : 0
  name = "${var.env}_${var.application}_${var.identity_group}"

  policy = <<EOT
# List key/value parameters
path "parameters/*"
{
  capabilities = ["list"]
}
# List, read, create and update key/value
path "parameters/${var.env}/${var.application}/*" {
  capabilities = ["read", "list"]
}
path "parameters/data/${var.env}/${var.application}/*" {
  capabilities = [ "read", "list"]
}
path "parameters/metadata/${var.env}/${var.application}/*" {
  capabilities = ["read", "list"]
}

EOT
}

resource "vault_policy" "parameters_write_policy" {
  count = var.permission == "parameters_write" ? 1 : 0
  name = "${var.env}_${var.application}_${var.identity_group}"

  policy = <<EOT
# List key/value parameters
path "parameters/*"
{
  capabilities = ["list"]
}
# List, read, create and update key/value
path "parameters/${var.env}/${var.application}/*" {
  capabilities = ["update", "read", "list", "create"]
}
path "parameters/data/${var.env}/${var.application}/*" {
  capabilities = ["update", "read", "list", "create"]
}
path "parameters/metadata/${var.env}/${var.application}/*" {
  capabilities = ["update", "read", "list", "create"]
}

EOT
}

resource "vault_policy" "devops_all_write_policy" {
  count = var.permission == "devops_write" ? 1 : 0
  name = "${var.identity_group}"

  policy = <<EOT
# List key/value credentials
path "credentials/*"
{
  capabilities = ["list"]
}
# List, read, create and update key/value
path "credentials/*" {
  capabilities = ["update", "read", "list", "create"]
}
path "credentials/data}" {
  capabilities = ["update", "read", "list", "create"]
}
path "credentials/metadata" {
  capabilities = ["update", "read", "list", "create"]
}

# List key/value parameters
path "parameters/*"
{
  capabilities = ["list"]
}
# List, read, create and update key/value
path "parameters/*" {
  capabilities = ["update", "read", "list", "create"]
}
path "parameters/data" {
  capabilities = ["update", "read", "list", "create"]
}
path "parameters/metadata" {
  capabilities = ["update", "read", "list", "create"]
}

EOT
}

resource "vault_policy" "sdet_qa_env_write_policy" {
  count = var.permission == "sdet_write" ? 1 : 0
  name = "qa_${var.identity_group}"

  policy = <<EOT
# List key/value credentials
path "credentials/*"
{
  capabilities = ["list"]
}
# List, read, create and update key/value
path "credentials/qa/*" {
  capabilities = ["update", "read", "list", "create"]
}
path "credentials/data/qa/*" {
  capabilities = ["update", "read", "list", "create"]
}
path "credentials/metadata/qa/*" {
  capabilities = ["update", "read", "list", "create"]
}

# List key/value parameters
path "parameters/*"
{
  capabilities = ["list"]
}
# List, read, create and update key/value
path "parameters/qa/*" {
  capabilities = ["update", "read", "list", "create"]
}
path "parameters/data/qa/*" {
  capabilities = ["update", "read", "list", "create"]
}
path "parameters/metadata/qa/*" {
  capabilities = ["update", "read", "list", "create"]
}


# List key/value credentials
path "credentials/*"
{
  capabilities = ["list"]
}
# List, read, create and update key/value
path "credentials/dev/*" {
  capabilities = ["update", "read", "list", "create"]
}
path "credentials/data/dev/*" {
  capabilities = ["update", "read", "list", "create"]
}
path "credentials/metadata/dev/*" {
  capabilities = ["update", "read", "list", "create"]
}

# List key/value parameters
path "parameters/*"
{
  capabilities = ["list"]
}
# List, read, create and update key/value
path "parameters/dev/*" {
  capabilities = ["update", "read", "list", "create"]
}
path "parameters/data/dev/*" {
  capabilities = ["update", "read", "list", "create"]
}
path "parameters/metadata/dev/*" {
  capabilities = ["update", "read", "list", "create"]
}


# List key/value parameters
path "parameters/*"
{
  capabilities = ["list"]
}
# List, read, create and update key/value
path "parameters/stg/*" {
  capabilities = ["update", "read", "list", "create"]
}
path "parameters/data/stg/*" {
  capabilities = ["update", "read", "list", "create"]
}
path "parameters/metadata/stg/*" {
  capabilities = ["update", "read", "list", "create"]
}




# List key/value parameters
path "parameters/*"
{
  capabilities = ["list"]
}
# List, read, create and update key/value
path "parameters/prod/*" {
  capabilities = ["read", "list"]
}
path "parameters/data/prod/*" {
  capabilities = ["read", "list"]
}
path "parameters/metadata/prod/*" {
  capabilities = ["read", "list"]
}

EOT
}