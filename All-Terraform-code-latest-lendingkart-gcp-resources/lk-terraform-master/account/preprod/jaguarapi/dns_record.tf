module "dns_record" {
  source            = "../../../modules/cloud_dns/record_set"
  app_endpoint_name = ["10.35.16.8"]
  app_name          = var.appname
  env               = var.env
  project_id        = "lk-mgmt-apps"
  type              = "A"
}