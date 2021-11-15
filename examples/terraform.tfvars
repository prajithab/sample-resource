project_id                      = "digital-dfp-dev"
region                          = "us-east4"
zone                            = "us-east4-b"
name                            = "pegasus-poc-tf1-mysql"
vpcnetwork                      = "vpc-cvs-hub-nonprod-1"
vpcproject                      = "vpc-equinix-cvs"
db_name                          = "VoyagerSDK"
user_name                        = "clientapi"
user_password                    = "-350Mx"
user_labels = { "env" = "dev", "app" = "pegasus", "itpr" = "dfp-team-pegasus", "costcenter" = "dfp" ,"dataclassification" ="pegasus"}
#random_instance_name            = false
#project_id                      = "digital-dfp-dev"
#database_version                = "MYSQL_8_0"
#tier                            = "db-n1-standard-1"
#activation_policy               = "ALWAYS"
#availability_type               = "ZONAL"
#disk_autoresize                 = true
#disk_size                       = 10
#disk_type                       = "PD_SSD"
#pricing_plan                    = "PER_USE"
#maintenance_window_day          = 6
#maintenance_window_hour         = 23
#maintenance_window_update_track = "canary"
# database_flags = [{ "name" = "sample", "value" = "sample" }, { "name" = "sample", "value" = "sample" } ]
#backup_configuration = {
#  binary_log_enabled             = false
#  enabled                        = false
#  start_time                     = null
#  location                       = null
#  transaction_log_retention_days = null
#  retained_backups               = null
#  retention_unit                 = null
#}
ip_configuration = {
  authorized_networks = []
  ipv4_enabled        = false
  private_network     = "vpc-cvs-hub-nonprod-1"
  require_ssl         = null
}

// Read Replicas

#read_replicas                    = []
#read_replica_name_suffix         = ""
#db_charset                       = ""
#db_collation                     = ""
#additional_databases             = []
#user_host                        = "%"
#additional_users                 = []
#create_timeout                   = "10m"
#update_timeout                   = "10m"
#delete_timeout                   = "10m"
#encryption_key_name              = null
#module_depends_on                = []
#deletion_protection              = false
#read_replica_deletion_protection = false
#enable_default_db                = true
#enable_default_user              = true

#ssl
#enable_client_ssl = false
#client_cert_name  = "clientapictecert"  <is it changed based on env?>