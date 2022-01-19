
module "sql_cluster" {
  source = "../../"

  project_id          = var.project_id
  region              = var.region
  zone                = var.zone
  vpcnetwork          = var.vpcnetwork
  vpcproject          = var.vpcproject
  db_name             = var.db_name
  name                = var.name
  user_name           = var.user_name
  user_password       = var.user_password
  user_labels         = var.user_labels
  database_version    = var.database_version
  encryption_key_name = var.encryption_key_name
  client_cert_name    = var.client_cert_name
}