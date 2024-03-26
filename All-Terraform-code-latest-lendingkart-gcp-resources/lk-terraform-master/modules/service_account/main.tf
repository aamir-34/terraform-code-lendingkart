resource "google_service_account" "service_account" {
  account_id   = "${var.org}-sa-${var.env}-${var.app_name}"
  display_name = "${var.org}-sa-${var.env}-${var.app_name}"
  description  = var.description
  project      = var.project_id
}
