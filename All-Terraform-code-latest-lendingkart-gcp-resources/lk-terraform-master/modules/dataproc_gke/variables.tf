variable "decommission_timeout" {
  description = "Graceful decommission timeout"
  default     = "120s"
}

variable "staging_bucket" {
  description = "Staging bucket for Dataproc"
}

variable "kubernetes_namespace" {
  description = "Kubernetes namespace for Dataproc"
}

variable "spark_version" {
  description = "Version of Apache Spark for Dataproc"
  default     = ""
}

variable "node_pool_locations" {
  description = "Locations of the GKE node pool"
  type        = list(string)
  default     = [ "asia-south1-a" ]
}

variable "min_node_count" {
  description = "Minimum number of nodes in the GKE node pool"
}

variable "max_node_count" {
  description = "Maximum number of nodes in the GKE node pool"
}

variable "machine_type" {
  description = "Machine type for GKE nodes"
}

variable "preemptible" {
  description = "Use preemptible GKE nodes"
  type        = bool
}

variable "local_ssd_count" {
  description = "Number of local SSDs for GKE nodes"
  default     = 1
}

variable "min_cpu_platform" {
  description = "Minimum CPU platform for GKE nodes"
  default     = "Intel Sandy Bridge"
}

variable "org" {
  type        = string
  description = "Organization short code like lk"
}

variable "env" {
  type        = string
  description = "Environment code like mgmt/dev/qa/prod"
}

variable "region_code" {
  type        = string
  description = "Region Code like as1"
}

variable "region" {
  type        = string
  description = "Region"
}
variable "project_id" {}

variable "app_name" {}
