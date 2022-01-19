#Mandatory Variables
region              = "us-east4"
zone                = "us-east4-b"
name                = "pegasus-poc-gita-postresql1-29"
vpcnetwork          = "vpc-cvs-hub-nonprod-1"
vpcproject          = "vpc-equinix-cvs"
project_id          = "digital-dfp-dev"
db_name             = "POSTGRESQLDB"
user_name           = "clientapi"
user_password       = "-350Mx"
database_version    = "POSTGRES_13"
encryption_key_name = "projects/digital-dfp-dev/locations/us-east4/keyRings/digital-dfp-dev-terratest/cryptoKeys/digital-dfp-dev-terratest"
client_cert_name    = "clientapictecert-1"
user_labels         = {
  "env"                = "dev", "app" = "pegasus", "itpr" = "dfp-team-pegasus", "costcenter" = "dfp",
  "dataclassification" = "pegasus"
}
deletion_protection = "true"
read_replica_deletion_protection = "true"
