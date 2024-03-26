module "vpc" {
  source       = "../../../../modules/networking/vpc"
  project_id   = var.project_id
  description  = "vpc network for '${var.env}'"
  env          = var.env
}