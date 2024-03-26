locals {
  services = var.enable_apis ? toset(distinct(var.list_activate_apis)) : toset(var.list_activate_apis_default)
}


resource "google_project_service" "google_project_service" {
  for_each                   = local.services
  project                    = var.project_id
  service                    = each.value
  disable_on_destroy         = var.disable_on_destroy
  disable_dependent_services = var.disable_dependent_services
  timeouts {
    create = "30m"
    read   = "10m"
    update = "30m"
    delete = "30m"
  }
}
