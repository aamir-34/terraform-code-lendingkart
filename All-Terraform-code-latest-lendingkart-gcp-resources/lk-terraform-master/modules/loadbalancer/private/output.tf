output "lb_name" {
  value = google_compute_region_url_map.pvt_http_lb_name.name
}
output "lb_ip" {
  value = google_compute_forwarding_rule.frontend.ip_address
}