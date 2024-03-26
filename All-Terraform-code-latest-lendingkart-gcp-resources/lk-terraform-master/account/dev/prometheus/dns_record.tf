module "prometheus_dns_record" {
  source            = "../../../modules/cloud_dns/record_set"
  app_endpoint_name = ["10.50.16.16"]
  app_name          = var.app_name
  env               = var.env
  project_id        = "lk-mgmt-apps"
  type              = "A"
}