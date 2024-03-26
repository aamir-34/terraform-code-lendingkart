/*
module "gke_node_pools" {
  source                      = "../../../../modules/gke/node_pools"
  location                    = var.region
  project_id                  = var.project_id
  labels                      = var.labels
  gke_cluster_name            = "${var.org}-gke-${var.env}-${var.region_code}"
  kms_crypto_key_name         = var.kms_crypto_key_as2
  env = var.env
  node_pool = {
    "${var.org}-np-${var.env}-ondemand-az2a-2b" = {
      max_node_count              = "3"
      min_node_count              = "1"
      node_locations              = ["asia-south2-a", "asia-south2-b"]
      disk_size_gb                = "300"
      disk_type                   = "pd-balanced"
      machine_type                = "e2-standard-8"
      oauth_scopes                = ["https://www.googleapis.com/auth/cloud-platform"]
      node_version                = "1.27.3-gke.100"
    }
    "${var.org}-np-${var.env}-spot-az2a-2b" = {
      max_node_count              = "3"
      min_node_count              = "1"
      node_locations              = ["asia-south2-a", "asia-south2-b"]
      disk_size_gb                = "300"
      disk_type                   = "pd-balanced"
      machine_type                = "e2-standard-8"
      oauth_scopes                = ["https://www.googleapis.com/auth/cloud-platform"]
      spot                        = true
      node_version                = "1.27.3-gke.100"
    }
 }
}
*/