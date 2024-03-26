resource "google_compute_router" "router" {
  name    = "${var.org}-cr-${var.env}-${var.use_case}-${var.region_code}" //var.router_name != "" ? var.router_name : "vpn-${var.name}"
  project = var.project_id
  region  = var.region
  network = "${var.org}-vpc-${var.env}" //var.network
  bgp {
    advertise_mode = (
      var.router_advertise_config == null
      ? null
      : var.router_advertise_config.mode
    )
    advertised_groups = (
      var.router_advertise_config == null ? null : (
        var.router_advertise_config.mode != "CUSTOM"
        ? null
        : var.router_advertise_config.groups
      )
    )
    dynamic "advertised_ip_ranges" {
      for_each = (
        var.router_advertise_config == null ? {} : (
          var.router_advertise_config.mode != "CUSTOM"
          ? {}
          : var.router_advertise_config.ip_ranges
        )
      )
      iterator = range
      content {
        range       = range.key
        description = range.value
      }
    }
    asn                = var.router_asn
    keepalive_interval = var.keepalive_interval
  }
}