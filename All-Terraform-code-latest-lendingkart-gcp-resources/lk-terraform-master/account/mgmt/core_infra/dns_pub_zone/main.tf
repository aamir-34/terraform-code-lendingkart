module "cloud_dns_pub_zone" {
  source = "../../../../modules/cloud_dns/pub_zone"
  domain = "lendingkart.io."
  name   = "public-lendingkart-io"
  project_id = var.project_id
  description = "Its public cloud dns zone, managed by terraform"
  type = "public"
}