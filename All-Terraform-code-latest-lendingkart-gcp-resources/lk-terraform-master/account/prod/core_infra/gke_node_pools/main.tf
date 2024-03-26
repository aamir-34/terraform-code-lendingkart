module "gke_node_pools" {
  source                      = "../../../../modules/gke/node_pools"
  location                    = var.region
  project_id                  = var.project_id
  labels                      = var.labels
  gke_cluster_name            = "${var.org}-gke-${var.env}-${var.region_code}"
  kms_crypto_key_name         = var.kms_crypto_key_as1
  env = var.env
  node_pool = {
    "${var.org}-np-${var.env}-ondemand-az1a-1c" = {
      max_node_count              = "5"
      min_node_count              = "1"
      node_locations              = ["asia-south1-a"]
      disk_size_gb                = "300"
      disk_type                   = "pd-balanced"
      machine_type                = "e2-standard-8"
      oauth_scopes                = ["https://www.googleapis.com/auth/cloud-platform"]
      node_version                = "1.28.3-gke.1286000"
    }
    "${var.org}-np-${var.env}-spot-az1a-1c" = {
      max_node_count              = "10"
      min_node_count              = "1"
      node_locations              = ["asia-south1-a"]
      disk_size_gb                = "300"
      disk_type                   = "pd-balanced"
      machine_type                = "e2-standard-8"
      oauth_scopes                = ["https://www.googleapis.com/auth/cloud-platform"]
      spot                        = true
      node_version                = "1.28.3-gke.1286000"
    }
 }
}