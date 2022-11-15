
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
  source = "git::ssh://git@gitw.cvshealth.com:da/dfp/terraform-modules/approved-for-use/terraform-google-cloudsql-postgresql.git"

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
  deletion_protection = var.deletion_protection
}
