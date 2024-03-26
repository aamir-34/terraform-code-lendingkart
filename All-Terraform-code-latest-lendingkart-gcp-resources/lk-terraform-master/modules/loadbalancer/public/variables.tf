## Load Balancer ##

variable "project_id" {
  description = "Name of the project"
  type        = string
}
variable "check_interval_sec" {
  description = "health check interval in sec"
  type        = number
  default     = 5
}
variable "timeout_sec" {
  description = "timeout in seconds"
  type        = number
  default     = 2
}
variable "healthy_threshold" {
  description = "healthy threshold"
  type        = number
  default     = 5
}
variable "unhealthy_threshold" {
  description = "unhealthy threshold"
  type        = number
  default     = 5
}
variable "request_path" {
  description = "The request path of the HTTP health check request"
  type        = string
  default     = "/healthz/ready"
}
variable "hc_port" {
  description = "The TCP port number for the HTTP health check request."
  type        = number
  default     = 15021
}
variable "redirect_response_code" {
  description = "redirect response code"
  type        = string
  default     = "MOVED_PERMANENTLY_DEFAULT"
}
variable "strip_query" {
  description = "strip query"
  type        = string
  default     = false
}
variable "https_redirect" {
  description = "https redirect"
  type        = string
  default     = true
}
variable "affinity_cookie_ttl_sec" {
  description = "affinity_cookie_ttl_sec"
  type        = number
  default     = 0
}
variable "enable_cdn" {
  description = "enable cdn"
  type        = string
  default     = false
}
variable "load_balancing_scheme" {
  description = "Name of the load balancing scheme"
  type        = string
  default     = "EXTERNAL_MANAGED"
}
variable "log_config_enable" {
  description = "log config enable"
  type        = string
  default     = false
}
variable "sample_rate" {
  description = "sample rate"
  type        = string
  default     = 0
}
variable "backend_protocol" {
  description = "protocol backend http"
  type        = string
  default     = "HTTP"
}
variable "session_affinity" {
  description = "session affinity"
  type        = string
  default     = "NONE"
}
variable "backend_timeout_sec" {
  description = "backend timeout sec"
  type        = number
  default     = 30
}
variable "balancing_mode" {
  description = "Specifies the balancing mode for this backend. For global HTTP(S) or TCP/SSL load balancing, Valid values are UTILIZATION, RATE (for HTTP(S)) and CONNECTION (for TCP/SSL)."
  type        = string
  default     = "RATE"
}
variable "max_rate_per_endpoint" {
  description = "The max requests per second (RPS) that a single backend network endpoint can handle."
  type        = string
  default     = "100"
}
variable "ip_protocol" {
  description = "protocol of the forwarding Rule"
  type        = string
  default     = "TCP"
}
variable "port_range_http" {
  description = "How often (in seconds) to send a health check"
  type        = string
  default     = "80"
}
variable "pub_lb_ip_type" {
  description = "type of load balancer static ip"
  type        = string
  default     = "EXTERNAL"
}

variable "ssl_cert_name" {
  description = "Name of SSL Certificate"
  type        = list(string)
  
}


variable "port_range_https" {
  description = "HTTPS Port number"
  type        = number
  default     = "443"
}
variable "labels" {
  description = "A set of key/value label pairs to assign to the bucket."
  type        = map(string)

  validation {
    condition     = can(var.labels["account"])
    error_message = "A account labels is required."
  }
  validation {
    condition     = can(var.labels["env"])
    error_message = "A env labels is required."
  }
}

variable "neg_groups" {
  type        = list(map(string))
  description = "The desired configuration options for authorized network"
  default     = []
}

variable "org" {}
variable "env" {}
variable "region_code" {}
variable "use_case" {}