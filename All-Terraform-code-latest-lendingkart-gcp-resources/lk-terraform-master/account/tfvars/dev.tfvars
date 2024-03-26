project_id   = "lk-dev-apps"
env          = "dev"
region       = "asia-south1"
region_code  = "as1"
org          = "lk"
zones        = ["asia-south1-a", "asia-south1-b", "asia-south1-c"]
labels       = { env = "dev", account = "lk-dev-apps" }

kms_crypto_key_as1 = "projects/lk-dev-apps/locations/asia-south1/keyRings/lk-kms-keyring-dev-as1/cryptoKeys/lk-crypto-key-dev-as1"
kms_crypto_key_as2 = "projects/lk-dev-apps/locations/asia-south2/keyRings/lk-kms-keyring-dev-as2/cryptoKeys/lk-crypto-key-dev-as2"

##### VPC & private cluster CIDR Details ###############
vpc_cidr_range = "10.50.0.0/16"
private_cluster_master_ipv4_cidr = "10.95.0.16/28"

### Shared Subnet Details ####
shared_subnet_cidr        = "10.50.8.0/21"
shared_sc_subnet_cidr_pod = "10.210.0.0/16"
shared_sc_subnet_cidr_svc = "10.110.0.0/16"     

##### App Subnet Details ####
app_subnet_cidr        = "10.50.16.0/21"
app_sc_subnet_cidr_pod = "10.211.0.0/16"
app_sc_subnet_cidr_svc = "10.111.0.0/16"

##### DB Subnet Details ####
db_subnet_cidr = "10.50.24.0/21"

##### Proxy Subnet Details ####
proxy_subnet_cidr = "10.50.40.0/21"

##### Offic and vpn CIDR Details #######
lk_blr_vt_onprem_cidr = "192.168.160.0/21"
lk_blr_forticlient_vpn_cidr =  "10.80.80.0/23"