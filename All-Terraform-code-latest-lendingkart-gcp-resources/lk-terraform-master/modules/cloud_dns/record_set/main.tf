resource "google_dns_record_set" "app_lendingkart_io_dns_pvt_record_mgmt" {
  count        = var.is_private_record && var.env == "mgmt" ? 1 : 0
  managed_zone = var.pvt_managed_zone
  name         = "${var.app_name}.lendingkart.io."
  project      = var.project_id
  rrdatas      = var.app_endpoint_name
  ttl          = var.ttl
  type         = var.type
}

resource "google_dns_record_set" "app_lendingkart_io_dns_pub_record_mgmt" {
  count        = var.is_public_record && var.env == "mgmt" ? 1 : 0
  managed_zone = var.pub_managed_zone
  name         = "${var.app_name}.lendingkart.io."
  project      = var.project_id
  rrdatas      = var.app_endpoint_name
  ttl          = var.ttl
  type         = var.type
}

resource "google_dns_record_set" "app_lendingkart_io_dns_pvt_record" {
  count        = var.env != "prod" && var.env != "mgmt" ? 1 : 0
  managed_zone = var.pvt_managed_zone
  name         = "${var.app_name}-${var.env}.lendingkart.io."
  project      = var.project_id
  rrdatas      = var.app_endpoint_name
  ttl          = var.ttl
  type         = var.type
}

resource "google_dns_record_set" "app_lendingkart_io_dns_pub_record" {
  count        = var.is_public_record && var.env != "prod" && var.env != "mgmt" ? 1 : 0
  managed_zone = var.pub_managed_zone
  name         = "${var.app_name}-${var.env}.lendingkart.io."
  project      = var.project_id
  rrdatas      = var.app_endpoint_name
  ttl          = var.ttl
  type         = var.type
}

##### postgres module
resource "google_dns_record_set" "postgres_lendingkart_io_dns_private_record" {
  count        = var.env != "prod" && var.postgres_enpoint!= null ? 1 : 0
  managed_zone = var.pvt_managed_zone
  name         = "${var.app_name}-postgres-${var.env}-${var.postgres_db_num}.lendingkart.io."
  project      = var.project_id
  type         = var.type
  ttl          = var.ttl
  rrdatas      = var.postgres_enpoint
}

###### mysql module
resource "google_dns_record_set" "mysql_lendingkart_io_dns_private_record" {
  count        = var.env != "prod" && var.mysql_enpoint!= null ? 1 : 0
  managed_zone = var.pvt_managed_zone
  name         = "${var.app_name}-mysql-${var.env}-${var.mysql_db_num}.lendingkart.io."
  project      = var.project_id
  type         = var.type
  ttl          = var.ttl
  rrdatas      = var.mysql_enpoint
}

###color_coded environments in non prod
resource "google_dns_record_set" "app_lendingkart_io_dns_private_record_additional" {
  count        = var.env != "prod" && var.env != "mgmt" ? length(var.additional_versions) : 0
  managed_zone = var.pvt_managed_zone
  name         = "${var.app_name}-${var.additional_versions[count.index]}-${var.env}.lendingkart.io."
  project      = var.project_id
  type         = var.type
  ttl          = 300
  rrdatas      = var.app_endpoint_name
}