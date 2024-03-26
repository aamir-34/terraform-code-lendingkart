variable "env" {}
variable "app_name" {}
variable "project_id" {}

variable "is_public_record" {
  default = false
}

variable "is_private_record" {
  default = true
}

variable "pvt_managed_zone" {
  type        = string
  default     = "private-lendingkart-io"
}

variable "pub_managed_zone" {
  type        = string
  default     = "public-lendingkart-io"
}

variable "app_endpoint_name" {
  description = "(required) - The string data for the records in this record set whose meaning depends on the DNS type. For TXT record, if the string data contains spaces, add surrounding \\\" if you don't want your string to get split on spaces. To specify a single record value longer than 255 characters such as a TXT record for DKIM, add \\\"\\\" inside the Terraform configuration string (e.g. \"first255characters\\\"\\\"morecharacters\")."
  type        = list(string)
}

variable "ttl" {
  description = "(required) - The time-to-live of this record set (seconds)."
  type        = number
  default     = 300
}

variable "type" {
  description = "(required) - The DNS record set type."
  type        = string
}

variable "postgres_enpoint" {
  type  = list(string)
  default = null
}

variable "postgres_db_num" {
  default = ""
}

variable "mysql_db_num" {
  default = ""
}

variable "mysql_enpoint" {
  type  = list(string)
  default = null
}

variable "additional_versions" {
  default = []
}