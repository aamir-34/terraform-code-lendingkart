module subnets {
    source  = "../../../../modules/networking/subnets"
    project_id = var.project_id
    network_name = "${var.org}-vpc-${var.env}"

    subnets = [
        {
            subnet_name           = "${var.org}-subnet-${var.env}-shared-${var.region_code}"
            subnet_ip             = var.shared_subnet_cidr
            subnet_region         = var.region
            description           = "This subnet for shared apps"
        },
        {
            subnet_name           = "${var.org}-subnet-${var.env}-app-${var.region_code}"
            subnet_ip             = var.app_subnet_cidr
            subnet_region         = var.region
            description           = "This subnet for app"
        },
        {
            subnet_name           = "${var.org}-subnet-${var.env}-db-${var.region_code}"
            subnet_ip             = var.db_subnet_cidr
            subnet_region         = var.region
            description           = "This subnet for backend db"
        },
        {
            subnet_name           = "${var.org}-subnet-${var.env}-proxy-${var.region_code}"
            subnet_ip             = var.proxy_subnet_cidr
            subnet_region         = var.region
            purpose               = "INTERNAL_HTTPS_LOAD_BALANCER"
            role                  = "ACTIVE"
            description           = "This subnet for Internal https lb"
            subnet_private_access = false
        }
    ]

    secondary_ranges = {
        "${var.org}-subnet-${var.env}-shared-${var.region_code}" = [
            {
                range_name    = "pod-shared-sc-subnet-${var.env}"
                ip_cidr_range =  var.shared_sc_subnet_cidr_pod
            },
            {
                range_name    = "svc-shared-sc-subnet-${var.env}"
                ip_cidr_range =  var.shared_sc_subnet_cidr_svc
            }
        ]
        "${var.org}-subnet-${var.env}-app-${var.region_code}" = [
            {
                range_name    = "pod-app-sc-subnet-${var.env}"
                ip_cidr_range = var.app_sc_subnet_cidr_pod
            },
            {
                range_name    = "svc-app-sc-subnet-${var.env}"
                ip_cidr_range = var.app_sc_subnet_cidr_svc
            }
        ]
    }
}