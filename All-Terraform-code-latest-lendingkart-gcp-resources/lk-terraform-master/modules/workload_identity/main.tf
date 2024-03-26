resource "google_service_account_iam_member" "main" {
  service_account_id = var.service_account_email
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.project_id}.svc.id.goog[${var.namespace}/${var.ksa_name}]"
}