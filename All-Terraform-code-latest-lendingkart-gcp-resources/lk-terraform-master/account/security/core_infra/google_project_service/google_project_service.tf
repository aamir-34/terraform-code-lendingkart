module "google_project_service" {
  source                     = "../../../../modules/google_project_service"
  project_id                 = var.project_id
  env                        = var.env
  region                     = var.region
  enable_apis                = var.enable_apis
  disable_on_destroy         = var.disable_on_destroy
  disable_dependent_services = var.disable_dependent_services
  list_activate_apis         = var.list_activate_apis
}