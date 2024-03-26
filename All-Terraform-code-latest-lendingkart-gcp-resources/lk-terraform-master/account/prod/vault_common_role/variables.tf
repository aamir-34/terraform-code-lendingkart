variable "project_id" {}

variable "region" {}

variable "auth_name" {
  default = "prod"
}

variable "env" {
  type = string
  default = "prod"
}

variable "service_accounts" {
  default = [
                "cn-kyc-consumer*",
                "digitalsignapi*",
                "fiserviceapi*",
                "fiservice-int*",
                "arsenal-int*",
                "cibil-change-consumer*",
                "enach-int*",
                "enach-scheduler*",
                "enach-consumer*",
                "enachapi*",
                "quadra-int*",
                "jaguarapi*",
                "arsenalapi*",
                "ectapi*",
                "auditapi*",
                "kyc-int*",
                "kyc-consumer*",
                "kycapi*",
                "kyc-scheduler*",
                "lgnd-schedular*",
                "rmsapi*",
                "collect10api*",
                "cn-cis-lfl-consumer*",
                "cn-scheduler*",
                "auxiliaryapi*",
                "tnc-consumer*",
                "ad-cdc-consumer*",
                "ect-cdc-consumer*",
                "ect-scheduler*",
                "ect-int*"
  ]
}