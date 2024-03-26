module "istio_pub_lb" {
  source          = "../../../../modules/loadbalancer/public"
  project_id      = var.project_id
  labels          = var.labels
  env             = var.env
  org             = var.org
  region_code     = var.region_code
  use_case        = var.use_case
  ssl_cert_name   = ["star-lendingkart-com"]
  neg_groups  = [
    {
      neg_group  = "https://www.googleapis.com/compute/v1/projects/${var.project_id}/zones/asia-south1-a/networkEndpointGroups/${var.pub_neg_name}"
    },
    {
      neg_group  = "https://www.googleapis.com/compute/v1/projects/${var.project_id}/zones/asia-south1-b/networkEndpointGroups/${var.pub_neg_name}"
    },
    {
      neg_group  = "https://www.googleapis.com/compute/v1/projects/${var.project_id}/zones/asia-south1-c/networkEndpointGroups/${var.pub_neg_name}"
    }
  ]
}