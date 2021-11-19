#Mandatory Variables
region              = "us-east4"
zone                = "us-east4-b"
name                = "pegasus-terratest-tf1-mysql-nprod-12"
vpcnetwork          = "vpc-cvs-hub-nonprod-1"
vpcproject          = "vpc-equinix-cvs"
project_id          = "digital-dfp-dev"
db_name             = "terratest_DB"
user_name           = "clientapi"
user_password       = "-350Mx"
database_version    = "MYSQL_8_0"
encryption_key_name = null
#enable_client_ssl = true   "As per security guide line it should be true and moved as default variable"
client_cert_name    = "clientapictecert-1"
user_labels         = {
  "env"                = "dev", "app" = "pegasus", "itpr" = "dfp-team-pegasus", "costcenter" = "dfp",
  "dataclassification" = "pegasus"
}

#optional Variables
disk_size                       = 10
tier                            = "db-n1-standard-16"
read_replicas                   = [
	{    "name"             = "-pegasus1"
  	}
]
read_replica_name_suffix        = "1"
additional_databases            = [{ "name" = "add-pega", "charset" = "utf8", "collation" = "utf8_general_ci" }]
additional_users                = [
  { "name" = "addusr1-pega", "host" = "%", "password" = "utf8generalci" },
  { "name" = "addusr2-pega", "host" = "%", "password" = "utf8generalci" }
]
create_timeout                  = "20m"
update_timeout                  = "20m"
module_depends_on               = ["pegasus"]
#availability_type = "ZONAL"
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


#random_instance_name = false
#activation_policy = "ALWAYS"
#disk_autoresize = true
#disk_type = "PD_SSD"
#pricing_plan = "PER_USE"
# database_flags = [{ "name" = "sample", "value" = "sample" }, { "name" = "sample", "value" = "sample" } ]

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
