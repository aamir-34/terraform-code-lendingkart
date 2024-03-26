## LOADBALANCER #
resource "google_compute_health_check" "lb_healthcheck" { //Creating Health check
  name                = "${var.org}-hc-${var.env}-${var.use_case}-${var.region_code}-01"
  project             = var.project_id
  check_interval_sec  = var.check_interval_sec
  timeout_sec         = var.timeout_sec
  healthy_threshold   = var.healthy_threshold
  unhealthy_threshold = var.unhealthy_threshold
  http_health_check {
    request_path = var.request_path
    port         = var.hc_port
  }
}
resource "google_compute_url_map" "pub_http_lb_name" { // http load balancer
  name            = "${var.org}-lb-${var.env}-${var.use_case}-${var.region_code}"
  project         = var.project_id
     default_url_redirect {
       redirect_response_code = var.redirect_response_code
       strip_query            = var.strip_query
       https_redirect         = var.https_redirect
     }
}
resource "google_compute_url_map" "pub_https_lb_name" { // https load balancer
  name            = "${var.org}-https-lb-${var.env}-${var.use_case}-${var.region_code}"
  project         = var.project_id
  default_service = google_compute_backend_service.lb_backend_service.self_link

}

resource "google_compute_target_http_proxy" "lb_target_http_proxy" { // target http proxy
  name    = "${var.org}-target-proxy-${var.env}-${var.use_case}-${var.region_code}-01"
  project = var.project_id
  url_map = google_compute_url_map.pub_http_lb_name.self_link
}

resource "google_compute_backend_service" "lb_backend_service" { // backend service
  affinity_cookie_ttl_sec = var.affinity_cookie_ttl_sec

  //connection_draining_timeout_sec = var.connection_draining_timeout_sec
  enable_cdn            = var.enable_cdn
  health_checks         = google_compute_health_check.lb_healthcheck.*.self_link
  load_balancing_scheme = var.load_balancing_scheme
  log_config {
    enable      = var.log_config_enable
    sample_rate = var.sample_rate
  }
  name             = "${var.org}-backend-${var.env}-${var.use_case}-${var.region_code}-01"
  project          = var.project_id
  protocol         = var.backend_protocol
  session_affinity = var.session_affinity
  timeout_sec      = var.backend_timeout_sec
  #security_policy  = "${var.org}-cloud-armor-policy-${var.env}-01"

  dynamic "backend" {

    for_each = var.neg_groups
    content {
      group                        = lookup(backend.value, "neg_group")
      balancing_mode               = var.balancing_mode
      max_rate_per_endpoint        = var.max_rate_per_endpoint
    }
  }
}
resource "google_compute_global_forwarding_rule" "frontend" { // frontend rules
  ip_address            = google_compute_global_address.reserved_ip.address
  ip_protocol           = var.ip_protocol
  load_balancing_scheme = var.load_balancing_scheme
  name                  = "${var.org}-fr-${var.env}-${var.use_case}-${var.region_code}-01"
  port_range            = var.port_range_http
  project               = var.project_id
  labels                = var.labels
  target                = google_compute_target_http_proxy.lb_target_http_proxy.self_link
}

## HTTPS forwording Rule ##

resource "google_compute_global_address" "reserved_ip" {
  name         = "${var.org}-ip-${var.env}-${var.use_case}-lb-01"
  address_type = var.pub_lb_ip_type
  project      = var.project_id
}

resource "google_compute_target_https_proxy" "lb_target_https_proxy" { // target https proxy
  name             = "${var.org}-https-target-proxy-${var.env}-${var.use_case}-${var.region_code}-01"
  project          = var.project_id
  url_map          = google_compute_url_map.pub_https_lb_name.self_link
  ssl_certificates = var.ssl_cert_name
}

resource "google_compute_global_forwarding_rule" "https_frontend" {
  name                  =  "${var.org}-https-fr-${var.env}-${var.use_case}-${var.region_code}-01"
  project               = var.project_id
  load_balancing_scheme = var.load_balancing_scheme
  target                = google_compute_target_https_proxy.lb_target_https_proxy.id
  port_range            = var.port_range_https
  ip_address            = google_compute_global_address.reserved_ip.address
} 