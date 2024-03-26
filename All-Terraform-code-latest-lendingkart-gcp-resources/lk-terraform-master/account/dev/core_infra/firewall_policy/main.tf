module "firewall_policy" {
  source       = "../../../../modules/networking/firewall_policy"
  project_id   = var.project_id
  policy_name  = "${var.org}-fw-policy-${var.env}"  
  description  = "frewall policy for ${var.env}"
  target_vpcs  = ["projects/${var.project_id}/global/networks/lk-vpc-${var.env}"]

  rules = [
    {
      priority                = "100"
      direction               = "INGRESS"
      action                  = "allow"
      description             = "allowed 1024 to 65535 for the response of outbound calls"
      match = {
        src_ip_ranges  = ["0.0.0.0/0"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["1024-65535"]
          }
        ]
      }
    },
    {
      priority                = "101"
      direction               = "INGRESS"
      action                  = "allow"
      description             = "allowed http from all IPs. For http to https redirection"
      match = {
        src_ip_ranges  = ["0.0.0.0/0"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["80"]
          }
        ]
      }
    },
    {
      priority                = "102"
      direction               = "INGRESS"
      action                  = "allow"
      description             = "allowed https from all IPs"
      match = {
        src_ip_ranges  = ["0.0.0.0/0"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["443"]
          }
        ]
      }
    },
    {
      priority                = "103"
      direction               = "INGRESS"
      action                  = "allow"
      description             = "allow for dev network"
      match = {
        src_ip_ranges  = ["10.50.0.0/16"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["0-65535"]
          }
        ]
      }
    },
    {
      priority                = "104"
      direction               = "INGRESS"
      action                  = "allow"
      description             = "allow for blr office nework"
      match = {
        src_ip_ranges  = ["192.168.160.0/21"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["0-65535"]
          }
        ]
      }
    },
    {
      priority                = "105"
      direction               = "INGRESS"
      action                  = "allow"
      description             = "allow for vpn"
      match = {
        src_ip_ranges  = ["10.80.80.0/23"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["0-65535"]
          }
        ]
      }
    },
    {
      priority                = "106"
      direction               = "INGRESS"
      action                  = "allow"
      description             = "allowd for global gke lb"
      enable_logging          = false
      match = {
        src_ip_ranges  = ["35.191.0.0/16", "130.211.0.0/22"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["15021"]
          }
        ]
      }
    },
    {
      priority                = "107"
      direction               = "EGRESS"
      action                  = "allow"
      description             = "allowed 1024 to 65535 for the response of incoming calls "
      match = {
        dest_ip_ranges  = ["0.0.0.0/0"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["1024-65535"]
          }
        ]
      }
    },
    {
      priority                = "108"
      direction               = "EGRESS"
      action                  = "allow"
      description             = "allowed http from all IPs. Allowed for package update"
      enable_logging          = false
      match = {
        dest_ip_ranges  = ["0.0.0.0/0"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["80"]
          }
        ]
      }
    },
    {
      priority                = "109"
      direction               = "EGRESS"
      action                  = "allow"
      description             = "allowed https from all IPs"
      enable_logging          = false
      match = {
        dest_ip_ranges  = ["0.0.0.0/0"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["443"]
          }
        ]
      }
    },
    {
      priority                = "110"
      direction               = "EGRESS"
      action                  = "allow"
      description             = "allowed mgmt cidr for inbound calls"
      enable_logging          = false
      match = {
        dest_ip_ranges  = ["10.40.0.0/16"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["0-65535"]
          }
        ]
      }
    },
    {
      priority    = "111"
      direction   = "INGRESS"
      action      = "allow"
      description = "allowed all traffic for aws production VPC"
      match = {
        src_ip_ranges = ["172.31.0.0/16"]
        layer4_configs = [
          {
            ip_protocol = "all"
          }
        ]
      }
    }
  ]
}