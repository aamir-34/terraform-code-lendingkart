variable "project_id" {}

variable "region" {}

variable "auth_name" {
  default = "qa"
}

variable "env" {
  type = string
  default = "qa"
}

variable "service_accounts" {
  default = [
                "digitalsignapi*",
                "jaguarapi*",
                "arsenal-int*",
                "arsenalapi*",
                "fiserviceapi*",
                "fiservice-int*",
                "ectapi*",
                "quadra-int*",
                "auditapi*",
                "cn-cis-lfl-consumer*",
                "kyc-int*",
                "kyc-consumer*",
                "kycapi*",
                "kyc-scheduler*",
                "cibil-change-consumer*",
                "enach-int*",
                "enach-scheduler*",
                "enach-consumer*",
                "enachapi*",
                "auxiliaryapi*",
                "collect10api*",
                "cn-scheduler*",
                "rmsapi*",
                "cn-kyc-consumer*",
                "lgnd-schedular*",
                "ad-cdc-consumer*",
                "tnc-consumer*",
                "ect-cdc-consumer*",
                "ect-scheduler*",
                "ect-int*"
  ]
}