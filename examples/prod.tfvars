#Mandatory Variables
region = "us-east4"
zone = "us-east4-b"
name = "pegasus-poc-tf1-mysql-prod"
vpcnetwork = "vpc-cvs-hub-nonprod-1"
vpcproject = "vpc-equinix-cvs"
project_id = "digital-dfp-dev"
db_name = "VoyagerSDK"
user_name = "clientapi"
user_password = "-350Mx"
database_version = "MYSQL_8_0"
encryption_key_name = null
enable_client_ssl = true
client_cert_name = "clientapictecert"
user_labels = { "env" = "dev", "app" = "pegasus", "itpr" = "dfp-team-pegasus", "costcenter" = "dfp",
"dataclassification" = "pegasus"
}

#optional Variables
disk_size = 50
tier = "db-n1-standard-1"
read_replicas = [2]
read_replica_name_suffix = ""
additional_databases = []
additional_users = []
create_timeout = "5m"
update_timeout = "5m"
module_depends_on = []
availability_type = "ZONAL"
maintenance_window_day = 6
maintenance_window_hour = 23
maintenance_window_update_track = "canary"
backup_configuration = {
  binary_log_enabled = true
  enabled = true
  start_time = "00:30"
  location = null
  transaction_log_retention_days = null
  retained_backups = null
  retention_unit = null
}

#random_instance_name = false
#activation_policy = "ALWAYS"
#disk_autoresize = true
#disk_type = "PD_SSD"
#pricing_plan = "PER_USE"
# database_flags = [{ "name" = "sample", "value" = "sample" }, { "name" = "sample", "value" = "sample" } ]
#backup_configuration = {
#ip_configuration = {
# authorized_networks = []
# ipv4_enabled = false
# private_network = "vpc-cvs-hub-nonprod-1"
# require_ssl = null
#}
// Read Replicas
#db_charset = ""
#db_collation = ""
#user_host = "%"
#delete_timeout = "10m"
#deletion_protection = false
#read_replica_deletion_protection = false
#enable_default_db = true
#enable_default_user = true