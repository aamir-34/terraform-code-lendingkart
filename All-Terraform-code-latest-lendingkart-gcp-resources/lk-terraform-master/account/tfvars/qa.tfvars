project_id  = "lk-qa-apps"
env         = "qa"
region      = "asia-south1"
region_code = "as1"
org         = "lk"
zones       = ["asia-south1-a", "asia-south1-b", "asia-south1-c"]
labels      = { env = "qa", account = "lk-qa-apps" }

kms_crypto_key_as1 = "projects/lk-qa-apps/locations/asia-south1/keyRings/lk-kms-keyring-qa-as1/cryptoKeys/lk-crypto-key-qa-as1"

org_id          = "1021574763396"
billing_account = "01B771-ABAB62-50AAAE"

#Variables used for service google_project
auto_create_network = false

#Variables used for service google_project_service
enable_apis                = true
disable_on_destroy         = true
disable_dependent_services = true
list_activate_apis = [
  "artifactregistry.googleapis.com",
  "bigtable.googleapis.com",
  "cloudkms.googleapis.com",
  "cloudresourcemanager.googleapis.com",
  "composer.googleapis.com",
  "compute.googleapis.com",
  "container.googleapis.com",
  "dataproc.googleapis.com",
  "dns.googleapis.com",
  "iam.googleapis.com",
  "iap.googleapis.com",
  "pubsub.googleapis.com",
  "servicemanagement.googleapis.com",
  "servicenetworking.googleapis.com",
  "spanner.googleapis.com",
  "sqladmin.googleapis.com",
  "sql-component.googleapis.com",
  "storage-component.googleapis.com"
]
##### VPC & private cluster CIDR Details ###############
vpc_cidr_range                   = "10.60.0.0/16"
private_cluster_master_ipv4_cidr = "10.95.0.32/28"

### Shared Subnet Details ####
shared_subnet_cidr        = "10.60.8.0/21"
shared_sc_subnet_cidr_pod = "10.220.0.0/16"
shared_sc_subnet_cidr_svc = "10.120.0.0/16"
##### App Subnet Details ####
app_subnet_cidr        = "10.60.16.0/21"
app_sc_subnet_cidr_pod = "10.221.0.0/16"
app_sc_subnet_cidr_svc = "10.121.0.0/16"
##### DB Subnet Details ####
db_subnet_cidr = "10.60.24.0/21"
##### Proxy Subnet Details ####
proxy_subnet_cidr = "10.60.40.0/21"

##### Offic and vpn CIDR Details #######
lk_blr_vt_onprem_cidr = "192.168.160.0/21"
lk_blr_forticlient_vpn_cidr =  "10.80.80.0/23"