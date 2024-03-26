module "google_dns_policy" {
  source = "../../../../modules/cloud_dns/google_dns_policy"
  description = "Its cloud dns server policy"
  name = "${var.org}-dns-server-policy-${var.env}"
  project_id = var.project_id
  networks = [{
    network_url = "https://www.googleapis.com/compute/v1/projects/${var.project_id}/global/networks/lk-vpc-${var.env}"
  }]
}