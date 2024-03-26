module "cloudnat" {
    source        = "../../../../modules/networking/nat_gw"
    project_id    = var.project_id
    region        = var.region
    router_name   = "${var.org}-cr-${var.env}-vpc-${var.region_code}"
    nat_ips       = [ "lk-ip-preprod-nat-as1-0", "lk-ip-preprod-nat-as1-1", "lk-ip-preprod-nat-as1-2"]
    depends_on    = [module.google_compute_external_address, module.router]
    env           = var.env
    use_case      = "vpc"
}

module "router" {
    source        = "../../../../modules/networking/router"
    project_id    = var.project_id
    region        = var.region
    network_name  = "${var.org}-vpc-${var.env}"
    env           = var.env
    use_case      = "vpc"
}

module "google_compute_external_address" {
    source              = "../../../../modules/networking/google_compute_address"
    number_of_addresses = 3
    description         = "Its VPC NAT IPs for External communication"
    region              = var.region
    env                 = var.env
    use_case            = "nat"
}
