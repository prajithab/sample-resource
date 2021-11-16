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
  source = "../../modules/sqlprod"

  project_id = var.project_id
  region     = var.region
  zone       = var.zone
  vpcnetwork = var.vpcnetwork
  vpcproject = var.vpcproject
  dbname     = var.dbname
  name       = var.name
  user_name  = var.user_name
  password   = var.user_password
  user_labels = var.user_labels
  database_version = var.database_version
  encryption_key_name = var.encryption_key_name
  enable_client_ssl = var.enable_client_ssl
  client_cert_name  = var.client_cert_name
  
}