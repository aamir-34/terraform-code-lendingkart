module "pvt_svc_connection" {
  source        = "../../../../modules/networking/private_service_connection"
  address       = "10.92.0.0"
  prefix_length = "16"
  project_id    = var.project_id
  org           = var.org
  env           = var.env
}

