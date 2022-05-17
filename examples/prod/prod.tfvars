#Mandatory Variables
region = "us-east4"
zone   = "us-east4-b"
postgresql = {
  postgresql-name-3 = { db_tier = "db-f1-micro", client_cert_name = "demo1" }
  postgresql-name-4 = { db_tier = "db-f1-micro", client_cert_name = "demo2" }
}
# name                = "pegasus-poc-sprint6-postgresql-prod01-val"
vpcnetwork          = "vpc-cvs-hub-nonprod-1"
vpcproject          = "vpc-equinix-cvs"
project_id          = "digital-dfp-dev"
db_name             = "POSTGRESQLDB"
# user_password       = "-350Mx"
database_version    = "POSTGRES_14"
encryption_key_name = "projects/digital-dfp-dev/locations/us-east4/keyRings/digital-dfp-dev-terratest/cryptoKeys/digital-dfp-dev-terratest"
# client_cert_name    = "clientapictecert"
user_labels = {
  "env"                = "dev", "app" = "pegasus", "itpr" = "dfp-team-pegasus", "costcenter" = "dfp",
  "dataclassification" = "pegasus"
}

#optional Variables
query_insights_config = {
  query_insights_enabled  = false
  record_application_tags = false
  record_client_address   = false
  query_string_length     = 1024
}
replica_query_insights_config = {
  query_insights_enabled  = true
  record_application_tags = false
  record_client_address   = false
  query_string_length     = 1024
}
point_in_time_recovery = true
disk_size              = 10
# tier      = "db-f1-micro"
read_replicas = [
  {
    "name" = "-pega1"
    zone   = "us-east4-a"
  }
  , {
    "name" = "-pega2"
    zone   = "us-east4-b"
  }
]
read_replica_name_suffix = "1"
additional_databases     = [{ "name" = "add-pega", "charset" = "utf8", "collation" = "en_US.UTF8" }]
# additional_users = [
#   { "name" = "addusr1-pega", "host" = "%", "password" = "utf8generalci" }
#   , { "name" = "addusr2-pega", "host" = "%", "password" = "utf8generalci" }
# ]
cloud_IAM_SAusers = [
  { "name" = "k8s-infrastructure-temporary" }

]
cloud_IAM_users = [
  { "name" = "samalg@aetna.com" }
]
create_timeout                  = "30m"
update_timeout                  = "30m"
module_depends_on               = ["pegasus"]
availability_type               = "ZONAL"
maintenance_window_day          = 3
maintenance_window_hour         = 16
maintenance_window_update_track = "canary"
backup_configuration = {
  binary_log_enabled             = false
  enabled                        = true
  start_time                     = "00:30"
  location                       = null
  transaction_log_retention_days = null
  retained_backups               = null
  retention_unit                 = null
}


