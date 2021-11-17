provider "google" {

  project = var.project_id
  region  = var.region
  zone    = var.zone
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

module "sql_cluster" {
  source = "../modules"

  project_id = var.project_id
  region     = var.region
  zone       = var.zone
  vpcnetwork = var.vpcnetwork
  vpcproject = var.vpcproject
  db_name     = var.db_name
  name       = var.name
  user_name  = var.user_name
  user_password   = var.user_password
  user_labels = var.user_labels
  database_version = var.database_version
  encryption_key_name = var.encryption_key_name
#  enable_client_ssl = var.enable_client_ssl
  client_cert_name  = var.client_cert_name
  disk_size=var.disk_size
  tier=var.tier
  read_replicas=var.read_replicas
  read_replica_name_suffix=var.read_replica_name_suffix
  additional_databases=var.additional_databases
  additional_users=var.additional_users
  create_timeout                  = var.create_timeout
  update_timeout                  = var.update_timeout
  module_depends_on=var.module_depends_on
  maintenance_window_day          = var.maintenance_window_day
  maintenance_window_hour         = var.maintenance_window_hour
  maintenance_window_update_track = var.maintenance_window_update_track
  backup_configuration=var.backup_configuration

}