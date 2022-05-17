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

  project_id          = var.project_id
  region              = var.region
  zone                = var.zone
  vpcnetwork          = var.vpcnetwork
  vpcproject          = var.vpcproject
  db_name             = var.db_name
  name                = var.name
  user_name           = data.vault_generic_secret.my_secret.data["user_name"]
  user_password       = data.vault_generic_secret.my_secret.data["password"]
  user_labels         = var.user_labels
  database_version    = var.database_version
  encryption_key_name = var.encryption_key_name
  client_cert_name    = var.client_cert_name
  deletion_protection = var.deletion_protection
}
