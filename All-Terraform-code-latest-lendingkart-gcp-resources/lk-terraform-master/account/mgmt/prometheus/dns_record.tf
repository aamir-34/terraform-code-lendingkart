module "prometheus_dns_record" {
  source            = "../../../modules/cloud_dns/record_set"
  app_endpoint_name = ["10.40.16.28"]
  app_name          = "prometheus-mgmt"
  env               = var.env
  project_id        = "lk-mgmt-apps"
  type              = "A"
}

module "alertmanager_dns_record" {
  source            = "../../../modules/cloud_dns/record_set"
  app_endpoint_name = ["10.40.16.28"]
  app_name          = "alertmanager"
  env               = var.env
  project_id        = "lk-mgmt-apps"
  type              = "A"
}