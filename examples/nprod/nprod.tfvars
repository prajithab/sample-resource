#Mandatory Variables
region              = "us-east4"
zone                = "us-east4-b"
name                = "pegasus-poc-sprint3-mysql-nprod-1"
vpcnetwork          = "vpc-cvs-hub-nonprod-1"
vpcproject          = "vpc-equinix-cvs"
project_id          = "digital-dfp-dev"
db_name             = "MysqlDB"
user_name           = "clientapi"
user_password       = "-350Mx"
database_version    = "MYSQL_8_0"
encryption_key_name = null
client_cert_name    = "clientapictecert-1"
user_labels         = {
  "env"                = "dev", "app" = "pegasus", "itpr" = "dfp-team-pegasus", "costcenter" = "dfp",
  "dataclassification" = "pegasus"
}