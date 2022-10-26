#Mandatory Variables
region              = "value" # The region of the Postgres resources. example: us-east4
zone                = "value" # The zone for the master instance, example: us-east4-b
name                = "value" # The name of the default database to create. example:jedi-poc-postgresql-nprod"
vpcnetwork          = "vpc-cvs-hub-nonprod-1" # nonprod vaule, see prod example for prod vpc.
vpcproject          = "vpc-equinix-cvs" # vpc for shared network
project_id          = "value" # example: digital-dfp-dev 
db_name             = "value" # The name of the default database to create. example: MysqlDB
database_version    = "POSTGRES_14" # The database version to use
encryption_key_name = "value" # The full path to the encryption key used for the CMEK disk encryption. example: projects/digital-dfp-dev/locations/us-east4/keyRings/digital-dfp-dev-terratest/cryptoKeys/digital-dfp-dev-terratest
client_cert_name    = "value" # name for the client certificate. example: name for the client certificate
# example labels:   "env" = "dev", "app" = "pegasus", "itpr" = "dfp-team-pegasus", "costcenter" = "dfp", "dataclassification" = "proprietary"
user_labels         = {
  "env" = "value", "app" = "value", "itpr" = "value", "costcenter" = "value",
  "dataclassification" = "value"
}
#Optional Variables
//Set to false only for testing purposes, otherwise defaulted to true
deletion_protection = true