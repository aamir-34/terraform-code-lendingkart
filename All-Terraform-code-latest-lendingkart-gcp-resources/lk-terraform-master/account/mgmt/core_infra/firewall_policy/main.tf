module "firewall_policy" {
  source      = "../../../../modules/networking/firewall_policy"
  project_id  = var.project_id
  policy_name = "${var.org}-fw-policy-${var.env}"
  description = "frewall policy for ${var.env}"
  target_vpcs = ["projects/${var.project_id}/global/networks/lk-vpc-${var.env}"]

  rules = [
    {
      priority    = "100"
      direction   = "INGRESS"
      action      = "allow"
      description = "allowed 1024 to 65535 for the response of outbound calls"
      match = {
        src_ip_ranges = ["0.0.0.0/0"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["1024-65535"]
          }
        ]
      }
    },
    {
      priority    = "101"
      direction   = "INGRESS"
      action      = "allow"
      description = "allowed http from all IPs. For http to https redirection"
      match = {
        src_ip_ranges = ["0.0.0.0/0"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["80"]
          }
        ]
      }
    },
    {
      priority    = "102"
      direction   = "INGRESS"
      action      = "allow"
      description = "allowed https from all IPs"
      match = {
        src_ip_ranges = ["0.0.0.0/0"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["443"]
          }
        ]
      }
    },
    {
      priority    = "103"
      direction   = "INGRESS"
      action      = "allow"
      description = "allow for mgmt network"
      match = {
        src_ip_ranges = ["10.40.0.0/16"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["0-65535"]
          }
        ]
      }
    },
    {
      priority    = "104"
      direction   = "INGRESS"
      action      = "allow"
      description = "allow for dev network"
      match = {
        src_ip_ranges = ["10.50.0.0/16"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["0-65535"]
          }
        ]
      }
    },
    {
      priority    = "105"
      direction   = "INGRESS"
      action      = "allow"
      description = "allow for qa network"
      match = {
        src_ip_ranges = ["10.60.0.0/16"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["0-65535"]
          }
        ]
      }
    },
    {
      priority    = "106"
      direction   = "INGRESS"
      action      = "allow"
      description = "allow for preprod network"
      match = {
        src_ip_ranges = ["10.35.0.0/16"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["0-65535"]
          }
        ]
      }
    },
    {
      priority    = "107"
      direction   = "INGRESS"
      action      = "allow"
      description = "allow for prod network"
      match = {
        src_ip_ranges = ["10.70.0.0/16"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["0-65535"]
          }
        ]
      }
    },
    {
      priority    = "108"
      direction   = "INGRESS"
      action      = "allow"
      description = "allow for blr & ahm office nework"
      match = {
        src_ip_ranges = ["192.168.160.0/21", "192.168.80.0/21"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["0-65535"]
          }
        ]
      }
    },
    {
      priority    = "109"
      direction   = "INGRESS"
      action      = "allow"
      description = "allow for blr & ahm vpn"
      match = {
        src_ip_ranges = ["10.80.80.0/23", "10.20.234.0/24"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["0-65535"]
          }
        ]
      }
    },
    {
      priority    = "110"
      direction   = "EGRESS"
      action      = "allow"
      description = "allowed 1024 to 65535 for the response of incoming calls "
      match = {
        dest_ip_ranges = ["0.0.0.0/0"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["1024-65535"]
          }
        ]
      }
    },
    {
      priority    = "111"
      direction   = "EGRESS"
      action      = "allow"
      description = "allowed http from all IPs. Allowed for package update"
      match = {
        dest_ip_ranges = ["0.0.0.0/0"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["80"]
          }
        ]
      }
    },
    {
      priority    = "112"
      direction   = "EGRESS"
      action      = "allow"
      description = "allowed https from all IPs"
      match = {
        dest_ip_ranges = ["0.0.0.0/0"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["443"]
          }
        ]
      }
    },
    {
      priority    = "113"
      direction   = "INGRESS"
      action      = "allow"
      description = "allowed dns for blr & ahm"
      match = {
        src_ip_ranges = ["192.168.160.0/21", "192.168.80.0/21" ]
        layer4_configs = [
          {
            ip_protocol = "udp"
            ports       = ["53"]
          },
        ]
      }
    },
    {
      priority    = "114"
      direction   = "INGRESS"
      action      = "allow"
      description = "allowd for global gke lb"
      match = {
        src_ip_ranges = ["35.191.0.0/16", "130.211.0.0/22"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["15021"]
          }
        ]
      }
    },
    {
      priority                = "115"
      direction               = "INGRESS"
      action                  = "allow"
      target_service_accounts = ["lk-sa-mgmt-packer@lk-mgmt-apps.iam.gserviceaccount.com"]
      description             = "allowed for jenkins-agent to connect to the packer build instance"
      match = {
        src_ip_ranges = ["10.40.16.0/21", "10.201.0.0/16"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["22"]
          }
        ]
      }
    },
    {
      priority    = "116"
      direction   = "INGRESS"
      action      = "allow"
      description = "allowed for SSH"
      match = {
        src_ip_ranges = ["35.235.240.0/20"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["22"]
          }
        ]
      }
    },
    {
      priority    = "117"
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