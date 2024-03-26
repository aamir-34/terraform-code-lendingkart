variable "project_id" {}

variable "region" {}

variable "auth_name" {
  default = "dev"
}

variable "env" {
  type = string
  default = "dev"
}

variable "service_accounts" {
  default = [
                "fiserviceapi*",
                "fiservice-int*",
                "crypto*",
                "cn-kyc-consumer*",
                "jaguarapi*",
                "arsenalapi*",
                "arsenal-int*",
                "digitalsignapi*",
                "auditapi*",
                "ectapi*",
                "tnc-consumer*",
                "quadra-int*",
                "auxiliaryapi*",
                "cn-scheduler*",
                "rmsapi*",
                "ravenapi*",
                "cn-cis-lfl-consumer*",
                "collect10api*",
                "cibil-change-consumer*",
                "enach-int*",
                "enach-scheduler*",
                "enach-consumer*",
                "enachapi*",
                "kyc-int*",
                "kyc-consumer*",
                "kycapi*",
                "kyc-scheduler*",
                "lgnd-schedular*",
                "ad-cdc-consumer*",
                "ect-cdc-consumer*",
                "ect-scheduler*",
                "ect-int*"
  ]
}