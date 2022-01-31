#Mandatory Variables
region              = "us-east4"
zone                = "us-east4-b"
name                = "pegasus-poc-gt-pg-duser-removed"
vpcnetwork          = "vpc-cvs-hub-nonprod-1"
vpcproject          = "vpc-equinix-cvs"
project_id          = "digital-dfp-dev"
db_name             = "POSTGRESQLDB"
user_password       = "-350Mx"
database_version    = "POSTGRES_14"
encryption_key_name = "projects/digital-dfp-dev/locations/us-east4/keyRings/digital-dfp-dev-terratest/cryptoKeys/digital-dfp-dev-terratest"
client_cert_name    = "clientapictecert-1"
user_labels         = {
  "env"                = "dev", "app" = "pegasus", "itpr" = "dfp-team-pegasus", "costcenter" = "dfp",
  "dataclassification" = "pegasus"
}

#Optional Variables
//deletion_protection = false  //Only for testing purpose it is set to false, defaulted to true.

