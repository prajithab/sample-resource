project_id                      = "digital-microservices-prod"
region                          = "us-east4"
zone                            = "us-east4-b"
name                            = "clientapi-prod-mysql"
random_instance_name            = false
database_version                = "MYSQL_8_0"
tier                            = "db-n1-standard-4"
activation_policy               = "ALWAYS"
availability_type               = "ZONAL"
disk_autoresize                 = true
disk_size                       = 100
disk_type                       = "PD_SSD"
pricing_plan                    = "PER_USE"
vpcnetwork                      = "vpc-cvs-hub-nonprod-1"
vpcproject                      = "vpc-equinix-cvs"
maintenance_window_day          = 6
maintenance_window_hour         = 23
maintenance_window_update_track = "canary"
# database_flags = [{ "name" = "sample", "value" = "sample" }, { "name" = "sample", "value" = "sample" } ]
user_labels = { "env" = "cte", "app" = "clientapi", "itpr" = "itpr048274", "costcenter" = "digital" }
backup_configuration = {
  binary_log_enabled             = false
  enabled                        = false
  start_time                     = null
  location                       = null
  transaction_log_retention_days = null
  retained_backups               = null
  retention_unit                 = null
}
ip_configuration = {
  authorized_networks = []
  ipv4_enabled        = false
  private_network     = "vpc-cvs-hub-nonprod-1"
  require_ssl         = null
}

// Read Replicas

read_replicas                    = []
read_replica_name_suffix         = ""
db_name                          = "VoyagerSDK"
db_charset                       = ""
db_collation                     = ""
additional_databases             = []
user_name                        = "clientapi"
user_host                        = "%"
user_password                    = "-350Mx"
additional_users                 = []
create_timeout                   = "10m"
update_timeout                   = "10m"
delete_timeout                   = "10m"
encryption_key_name              = null
module_depends_on                = []
deletion_protection              = false
read_replica_deletion_protection = false
enable_default_db                = true
enable_default_user              = true

#ssl
enable_client_ssl = false
client_cert_name  = "clientapictecert"