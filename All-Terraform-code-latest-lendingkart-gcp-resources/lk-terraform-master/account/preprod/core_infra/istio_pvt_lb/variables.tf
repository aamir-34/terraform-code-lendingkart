variable "project_id" {}

variable "labels" {}

variable "region" {}

variable "org" {}

variable "env" {}

variable "region_code" {}

variable "use_case" {
    default = "pvt-istio"

}
variable "pvt_neg_name" {}

/* variable "balancing_mode" {
  description = "Specifies the balancing mode for this backend. For global HTTP(S) or TCP/SSL load balancing, Valid values are UTILIZATION, RATE (for HTTP(S)) and CONNECTION (for TCP/SSL)."
  type        = string
  default     = "RATE"
}
variable "max_rate_per_endpoint" {
  description = "The max requests per second (RPS) that a single backend network endpoint can handle."
  type        = string
  default     = "100"
}
variable "capacity_scaler" {
  description = "A multiplier applied to the group's maximum servicing capacity (based on UTILIZATION, RATE or CONNECTION"
  type        = string
  default     = "1.0"
} */