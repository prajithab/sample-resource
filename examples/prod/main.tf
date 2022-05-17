provider "vault" {
   address = "https://vault-nonprod.cvshealth.com"
   auth_login {
     path = "auth/terraform-digital-dfp-dev-jedi-readrole/login"

     parameters = {
       role_id   = var.login_approle_role_id
       secret_id = var.login_approle_secret_id
     }
   }

}

data "vault_generic_secret" "my_secret" {
     path = "kv-v2/app/terraform/digital-dfp-dev/jedi/cloudsql-postgresql"
}

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
  source = "../../"
  for_each = var.postgresql
  project_id                      = var.project_id
  region                          = var.region
  zone                            = var.zone
  vpcnetwork                      = var.vpcnetwork
  vpcproject                      = var.vpcproject
  db_name                         = var.db_name
  name  = each.key 
  # name                            = var.name
  user_name           = data.vault_generic_secret.my_secret.data["user_name"]
  user_password       = data.vault_generic_secret.my_secret.data["password"]
  user_labels                     = var.user_labels
  database_version                = var.database_version
  encryption_key_name             = var.encryption_key_name
  # client_cert_name                = var.client_cert_name
  client_cert_name  = each.value.client_cert_name
  disk_size                       = var.disk_size
  # tier                            = var.tier
  tier  = each.value.db_tier
  read_replicas                   = var.read_replicas
  read_replica_name_suffix        = var.read_replica_name_suffix
  additional_databases            = var.additional_databases
  # additional_users                = var.additional_users
  cloud_IAM_users                 = var.cloud_IAM_users
  cloud_IAM_SAusers               = var.cloud_IAM_SAusers
  create_timeout                  = var.create_timeout
  update_timeout                  = var.update_timeout
  module_depends_on               = var.module_depends_on
  maintenance_window_day          = var.maintenance_window_day
  maintenance_window_hour         = var.maintenance_window_hour
  maintenance_window_update_track = var.maintenance_window_update_track
  backup_configuration            = var.backup_configuration
  availability_type               = var.availability_type
  point_in_time_recovery  = var.point_in_time_recovery
  query_insights_config = var.query_insights_config
  replica_query_insights_config = var.replica_query_insights_config
}
