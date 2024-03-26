module "google_project" {
  source              = "../../../../modules/google_project"
  project             = var.project_id
  env                 = var.env
  region              = var.region
  billing_account     = var.billing_account
  project_id          = var.project_id
  org_id              = var.org_id
  auto_create_network = var.auto_create_network
  labels              = var.labels
}
