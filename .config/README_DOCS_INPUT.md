# terraform-google-cloudsql-postgresql

## Ownership

This module was developed by the Pegasus team.
Contact info: DL202101181149363320@AETNA.com

### README formatting
This readme document is maintained via the terraform-docs tool.
Information on terraform-docs is available here:https://terraform-docs.io/user-guide/configuration/content/
The configuration files for terraform-docs are contained in this folder:
./.config
    README_DOCS_INPUT.md - Manually entered text of readme
    .tfdocs-config.yml - terradocs template

To generate a new readme, run this command from the module's root directory:
terraform-docs -c .config/.tfdocs-config.yml . > README.md

## Scope

terraform-google-cloudsql-postgresql makes it easy to create a secure Google CloudSQL instance in a private subnet and implement high availability settings.
This module consists of the following submodules:

- [mysql](https://gitw.cvshealth.com/da/dfp/terraform-modules/terraform-google-cloudsql-postgresql)

See more details in the example folders README.

## Guarantees

This module enforces the following guidelines:

[Custom CVS standard for Cloud SQL Database](https://cvsdigital.atlassian.net/wiki/spaces/CDSC/pages/2069103751/Custom+CVS+standard+for+Cloud+SQL+Database)

and follows these guidelines:

[Module Development Practices](https://cvsdigital.atlassian.net/wiki/spaces/~44381436/pages/2149221346/Module+Development+Practices)

[HashiCorp Standard Module Structure](https://www.terraform.io/docs/language/modules/develop/structure.html)

## Modules

This module has root configuration.
Copy and paste into your Terraform configuration,In the `examples` section insert the variables (*.tfvars based on environment), and run terraform init :

For MySQL :
```
module "sql_cluster" {
  source = "../"

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
  client_cert_name  = var.client_cert_name
  }
```

