variable "project_id" {}

variable "region" {}

variable "auth_name" {
  default = "preprod"
}

variable "env" {
  type = string
  default = "preprod"
}

variable "service_accounts" {
  default = [
                "jaguarapi*",
                "arsenalapi*",
                "ectapi*",
                "quadra-int*",
                "auditapi*",
                "auxiliaryapi*",
                "arsenal-int*",
                "cibil-change-consumer*",
                "enach-int*",
                "enach-scheduler*",
                "enach-consumer*",
                "enachapi*",
                "kyc-int*",
                "kyc-consumer*",
                "kycapi*",
                "kyc-scheduler*",
                "cn-kyc-consumer*",
                "digitalsignapi*",
                "fiserviceapi*",
                "fiservice-int*",
                "collect10api*",
                "rmsapi*",
                "cn-cis-lfl-consumer*",
                "cn-scheduler*",
                "lgnd-schedular*",
                "tnc-consumer*",
                "ad-cdc-consumer*",
                "ect-cdc-consumer*",
                "ect-scheduler*",
                "ect-int*"
  ]
}