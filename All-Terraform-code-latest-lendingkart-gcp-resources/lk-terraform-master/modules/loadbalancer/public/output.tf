output "lb_name" {
  value = google_compute_url_map.pub_http_lb_name.name
}
output "lb_ip" {
  value = google_compute_global_forwarding_rule.frontend.ip_address
}