project_id  = "lk-prod-apps"
env         = "prod"
region      = "asia-south2"
region_code = "as2"
org         = "lk"
zones       = ["asia-south2-a", "asia-south2-b", "asia-south2-c"]
labels      = { env = "prod", account = "lk-prod-apps" }

kms_crypto_key_as2 = "projects/lk-prod-apps/locations/asia-south2/keyRings/lk-kms-keyring-prod-as2/cryptoKeys/lk-crypto-key-prod-as2"
org_id          = "1021574763396"
billing_account = "01B771-ABAB62-50AAAE"

#Variables used for service google_project
auto_create_network = false

##### VPC & private cluster CIDR Details ###############
vpc_cidr_range                   = "10.160.0.0/16"
private_cluster_master_ipv4_cidr = "10.95.0.128/28"

### Shared Subnet Details ####
shared_subnet_cidr        = "10.160.8.0/21"
shared_sc_subnet_cidr_pod = "10.240.0.0/16"
shared_sc_subnet_cidr_svc = "10.140.0.0/16"
##### App Subnet Details ####
app_subnet_cidr        = "10.160.16.0/21"
app_sc_subnet_cidr_pod = "10.241.0.0/16"
app_sc_subnet_cidr_svc = "10.141.0.0/16"
##### DB Subnet Details ####
db_subnet_cidr = "10.160.24.0/21"
##### Proxy Subnet Details ####
proxy_subnet_cidr = "10.160.40.0/21"

##### Offic and vpn CIDR Details #######
lk_blr_onprem_cidr = "192.168.120.0/21"
lk_blr_vpn_cidr    = "10.81.81.0/24"