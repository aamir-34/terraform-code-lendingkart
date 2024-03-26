/*
module "cloudnat" {
    source        = "../../../../modules/networking/nat_gw"
    project_id    = var.project_id
    region        = var.region
    router_name   = "${var.org}-cr-${var.env}-vpc-${var.region_code}"
    nat_ips       = [ "lk-ip-prod-nat-as2-0", "lk-ip-prod-nat-as2-1", "lk-ip-prod-nat-as2-2" ]
    depends_on    = [module.google_compute_external_address, module.router]
    env           = var.env
    use_case      = "vpc"
    region_code   = var.region_code
}

module "router" {
    source        = "../../../../modules/networking/router"
    project_id    = var.project_id
    region        = var.region
    network_name  = "${var.org}-vpc-${var.env}"
    env           = var.env
    use_case      = "vpc"
    router_asn    = "64522"
    region_code   = var.region_code
}

module "google_compute_external_address" {
    source              = "../../../../modules/networking/google_compute_address"
    number_of_addresses = 3
    description         = "Its VPC NAT IPs for External communication"
    region              = var.region
    env                 = var.env
    use_case            = "nat"
    region_code   = var.region_code
}
*/