resource "google_project" "google_project" {
  name                = var.project
  billing_account     = var.billing_account
  project_id          = var.project_id
  org_id              = var.org_id
  auto_create_network = var.auto_create_network
  labels              = var.labels
}
