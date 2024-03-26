module "dns_record" {
  source            = "../../../modules/cloud_dns/record_set"
  app_endpoint_name = ["10.40.16.47"]
  app_name          = var.app_name
  env               = var.env
  project_id        = var.project_id
  type              = "A"
  postgres_enpoint  = ["10.90.0.5"]
  postgres_db_num   = "01"
}