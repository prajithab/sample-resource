#Mandatory Variables
region              = "us-east4"
zone                = "us-east4-b"
name                = "pegasus-poc-sprint6-postgresql-prod-1-1"
vpcnetwork          = "vpc-cvs-hub-nonprod-1"
vpcproject          = "vpc-equinix-cvs"
project_id          = "digital-dfp-dev"
db_name             = "POSTGRESQLDB"
user_name           = "clientapi"
user_password       = "-350Mx"
database_version    = "POSTGRES_13"
encryption_key_name = null
client_cert_name    = "clientapictecert"
user_labels         = {
  "env"                = "dev", "app" = "pegasus", "itpr" = "dfp-team-pegasus", "costcenter" = "dfp",
  "dataclassification" = "pegasus"
}

#optional Variables
disk_size                       = 10
tier                            = "db-n1-standard-16"
read_replicas                   = [
  {
    "name" = "-pega1"
    zone   = "us-east4-a"
  }, {
    "name" = "-pega2"
    zone   = "us-east4-b"
  }
]
read_replica_name_suffix        = "1"
additional_databases            = [{ "name" = "add-pega", "charset" = "utf8", "collation" = "utf8_general_ci" }]
#additional_users                = [
#  { "name" = "addusr1-pega", "host" = "%", "password" = "utf8generalci" },
#  { "name" = "addusr2-pega", "host" = "%", "password" = "utf8generalci" }
#]
cloud_IAM_SAusers                 = [
  { "name" = "k8s-infrastructure-temporary@digital-dfp-dev.iam.gserviceaccount.com" }
]
cloud_IAM_users                 = [
  { "name" = "reddys10@aetna.com" }
]
create_timeout                  = "30m"
update_timeout                  = "30m"
module_depends_on               = ["pegasus"]
availability_type               = "REGIONAL"
maintenance_window_day          = 3
maintenance_window_hour         = 16
maintenance_window_update_track = "canary"
backup_configuration            = {
  binary_log_enabled             = true
  enabled                        = true
  start_time                     = "00:30"
  location                       = null
  transaction_log_retention_days = null
  retained_backups               = null
  retention_unit                 = null
}