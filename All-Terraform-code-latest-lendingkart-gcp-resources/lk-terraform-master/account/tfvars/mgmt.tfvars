########## Global Varibles ##########
project_id          = "lk-mgmt-apps"
region              = "asia-south1"
org                 = "lk"
env                 = "mgmt"
region_code         = "as1"
labels              = { env = "mgmt", account = "lk-mgmt-apps" }
pvt_neg_name        = "lk-neg-pvt-istio-ingress-gw"
pub_neg_name        = "lk-neg-pub-istio-ingress-gw"

kms_crypto_key_as1  = "projects/lk-mgmt-apps/locations/asia-south1/keyRings/lk-kms-keyring-mgmt-as1/cryptoKeys/lk-crypto-key-mgmt-as1"
kms_crypto_key_as2  = "projects/lk-mgmt-apps/locations/asia-south2/keyRings/lk-kms-keyring-mgmt-as2/cryptoKeys/lk-crypto-key-mgmt-as2"

##### VPC & private cluster CIDR Details ###############
vpc_cidr_range      = "10.40.0.0/16"
private_cluster_master_ipv4_cidr = "10.95.0.0/28"

### Shared Subnet Details ####
shared_subnet_cidr        = "10.40.8.0/21"
shared_sc_subnet_cidr_pod = "10.200.0.0/16"
shared_sc_subnet_cidr_svc = "10.100.0.0/16"

##### App Subnet Details ####
app_subnet_cidr        = "10.40.16.0/21"
app_sc_subnet_cidr_pod = "10.201.0.0/16"
app_sc_subnet_cidr_svc = "10.101.0.0/16"

##### DB Subnet Details ####
db_subnet_cidr = "10.40.24.0/21"

##### Proxy Subnet Details ####
proxy_subnet_cidr = "10.40.40.0/21"

###### Offic and vpn CIDR Details #####
lk_blr_vt_onprem_cidr = "192.168.160.0/21"
lk_blr_forticlient_vpn_cidr =  "10.80.80.0/23"