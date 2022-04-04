
module "sql_cluster" {
  source = "../../"

  project_id                      = var.project_id
  region                          = var.region
  zone                            = var.zone
  vpcnetwork                      = var.vpcnetwork
  vpcproject                      = var.vpcproject
  db_name                         = var.db_name
  name                            = var.name
  user_name                       = var.user_name
  user_password                   = var.user_password
  user_labels                     = var.user_labels
  database_version                = var.database_version != "" ? var.database_version: "POSTGRES_14"
  encryption_key_name             = var.encryption_key_name
  client_cert_name                = var.client_cert_name
  disk_size                       = var.disk_size
  tier                            = var.tier
  read_replicas                   = var.read_replicas
  read_replica_name_suffix        = "1"
  additional_databases            = var.additional_databases
  additional_users                = var.additional_users
  cloud_IAM_users                 = var.cloud_IAM_users
  cloud_IAM_SAusers               = var.cloud_IAM_SAusers
  create_timeout                  = var.create_timeout != "" ? var.create_timeout : "30m"
  update_timeout                  = var.update_timeout != "" ? var.update_timeout : "30m"
  module_depends_on               = var.module_depends_on
  maintenance_window_day          = var.maintenance_window_day != 1 ? var.maintenance_window_day :  3
  maintenance_window_hour         = var.maintenance_window_hour != 0 ? var.maintenance_window_hour : 16
  maintenance_window_update_track = var.maintenance_window_update_track
  backup_configuration            = {
                                      binary_log_enabled             = false
                                      enabled                        = true
                                      start_time                     = "00:30"
                                      location                       = null
                                      transaction_log_retention_days = null
                                      retained_backups               = null
                                      retention_unit                 = null
                                    }
  availability_type               = "REGIONAL"
  deletion_protection = false
  read_replica_deletion_protection = false
 
}
