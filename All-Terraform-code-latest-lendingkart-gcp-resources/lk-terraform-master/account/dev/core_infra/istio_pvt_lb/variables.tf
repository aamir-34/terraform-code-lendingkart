variable "project_id" {}

variable "labels" {}

variable "region" {}

variable "org" {}

variable "env" {}

variable "region_code" {}

variable "use_case" {
    default = "pvt-istio"

}
variable "pvt_neg_name" {
    default = "lk-neg-pvt-istio-ingress-gw"
}