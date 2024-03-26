
variable "machine_type" {
  description = "Machine type for master and worker vm"
}

variable "org" {
  type        = string
  description = "Organization short code like lk"
}

variable "env" {
  type        = string
  description = "Environment code like mgmt/dev/qa/prod"
}

variable "region_code" {
  type        = string
  description = "Region Code like as1"
}

variable "region" {
  type        = string
  description = "Region"
}
variable "project_id" {}

variable "app_name" {}

variable "num_workers" {
  description = "Number of worker nodes"
}


variable "boot_disk_type" {
  default = "pd-standard"
}


variable "num_master" {
  description = "Number of master nodes"
}

variable "labels" {
  default = {
    team = "data-engg"
  }
  
}

variable "dataproc_cluster" {
  description = "Map of node pool configurations"
  type = map(object({
    num_count                   = number
    use_case                    = optional(string, "")
    image_version               = string
    dataproc_master_bootdisk   = string
    dataproc_worker_bootdisk    = string
    override_properties         = map(string)
    
  }))
}