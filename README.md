
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

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >1.0.0 |
## Resources

| Name | Type |
|------|------|
| [google-beta_google_sql_database_instance.default](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_sql_database_instance) | resource |
| [google_sql_database.additional_databases](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database) | resource |
| [google_sql_database.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database) | resource |
| [google_sql_database_instance.replicas](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance) | resource |
| [google_sql_ssl_cert.client_cert](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_ssl_cert) | resource |
| [google_sql_ssl_cert.replica_client_cert](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_ssl_cert) | resource |
| [google_sql_user.additional_users](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |
| [google_sql_user.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |
| [google_sql_user.sausers](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |
| [google_sql_user.users](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |
| [null_resource.module_depends_on](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [random_id.suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [google_compute_network.postgresql_network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_network) | data source |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_Iam_Cloud_Sql_sauser"></a> [Iam\_Cloud\_Sql\_sauser](#output\_Iam\_Cloud\_Sql\_sauser) | The service account email address assigned to the master instance |
| <a name="output_Iam_Cloud_Sql_user"></a> [Iam\_Cloud\_Sql\_user](#output\_Iam\_Cloud\_Sql\_user) | The service account email address assigned to the master instance |
| <a name="output_instance_connection_name"></a> [instance\_connection\_name](#output\_instance\_connection\_name) | The connection name of the master instance to be used in connection strings |
| <a name="output_instance_encryption_key_name"></a> [instance\_encryption\_key\_name](#output\_instance\_encryption\_key\_name) | The service account email address assigned to the master instance |
| <a name="output_instance_logging_monitoring_database_flags"></a> [instance\_logging\_monitoring\_database\_flags](#output\_instance\_logging\_monitoring\_database\_flags) | The service account email address assigned to the master instance |
| <a name="output_instance_name"></a> [instance\_name](#output\_instance\_name) | The instance name for the master instance |
| <a name="output_instance_self_link"></a> [instance\_self\_link](#output\_instance\_self\_link) | The URI of the master instance |
| <a name="output_instance_service_account_email_address"></a> [instance\_service\_account\_email\_address](#output\_instance\_service\_account\_email\_address) | The service account email address assigned to the master instance |
| <a name="output_instance_ssl_cert_name"></a> [instance\_ssl\_cert\_name](#output\_instance\_ssl\_cert\_name) | The service account email address assigned to the master instance |
| <a name="output_private_address"></a> [private\_address](#output\_private\_address) | The private IP address assigned for the master instance |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_cert_name"></a> [client\_cert\_name](#input\_client\_cert\_name) | name for the client certificate | `string` | n/a | yes |
| <a name="input_database_version"></a> [database\_version](#input\_database\_version) | The database version to use | `string` | n/a | yes |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | The name of the default database to create | `string` | n/a | yes |
| <a name="input_encryption_key_name"></a> [encryption\_key\_name](#input\_encryption\_key\_name) | The full path to the encryption key used for the CMEK disk encryption | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the Cloud SQL resources | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project ID to manage the Cloud SQL resources | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region of the Cloud SQL resources | `string` | n/a | yes |
| <a name="input_user_labels"></a> [user\_labels](#input\_user\_labels) | The key/value labels for the master instances. | `map(string)` | n/a | yes |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | The name of the default user | `string` | n/a | yes |
| <a name="input_user_password"></a> [user\_password](#input\_user\_password) | The password for the default user. If not set, a random one will be generated and available in the generated\_user\_password output variable. | `string` | n/a | yes |
| <a name="input_vpcnetwork"></a> [vpcnetwork](#input\_vpcnetwork) | The charset for the default database | `string` | n/a | yes |
| <a name="input_vpcproject"></a> [vpcproject](#input\_vpcproject) | The charset for the default database | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone for the master instance, it should be something like: `us-central1-a`, `us-east1-c`. | `string` | n/a | yes |
| <a name="input_activation_policy"></a> [activation\_policy](#input\_activation\_policy) | The activation policy for the master instance. Can be either `ALWAYS`, `NEVER` or `ON_DEMAND`. | `string` | `"ALWAYS"` | no |
| <a name="input_additional_databases"></a> [additional\_databases](#input\_additional\_databases) | A list of databases to be created in your cluster | <pre>list(object({<br>    name      = string<br>    charset   = string<br>    collation = string<br>  }))</pre> | `[]` | no |
| <a name="input_additional_users"></a> [additional\_users](#input\_additional\_users) | A list of users to be created in your cluster | <pre>list(object({<br>    name     = string<br>    password = string<br>    host     = string<br>  }))</pre> | `[]` | no |
| <a name="input_availability_type"></a> [availability\_type](#input\_availability\_type) | The availability type for the master instance. Can be either `REGIONAL` or `ZONAL`. | `string` | `"REGIONAL"` | no |
| <a name="input_backup_configuration"></a> [backup\_configuration](#input\_backup\_configuration) | The backup\_configuration settings subblock for the database setings | <pre>object({<br>    binary_log_enabled             = bool<br>    enabled                        = bool<br>    start_time                     = string<br>    location                       = string<br>    transaction_log_retention_days = string<br>    retained_backups               = number<br>    retention_unit                 = string<br>  })</pre> | <pre>{<br>  "binary_log_enabled": true,<br>  "enabled": true,<br>  "location": null,<br>  "retained_backups": null,<br>  "retention_unit": null,<br>  "start_time": "00:30",<br>  "transaction_log_retention_days": null<br>}</pre> | no |
| <a name="input_cloud_IAM_SAusers"></a> [cloud\_IAM\_SAusers](#input\_cloud\_IAM\_SAusers) | A list of users to be created in your cluster | <pre>list(object({<br>    name = string<br>  }))</pre> | `[]` | no |
| <a name="input_cloud_IAM_users"></a> [cloud\_IAM\_users](#input\_cloud\_IAM\_users) | A list of users to be created in your cluster | <pre>list(object({<br>    name = string<br>  }))</pre> | `[]` | no |
| <a name="input_create_timeout"></a> [create\_timeout](#input\_create\_timeout) | The optional timout that is applied to limit long database creates. | `string` | `"30m"` | no |
| <a name="input_database_flags"></a> [database\_flags](#input\_database\_flags) | List of Cloud SQL flags that are applied to the database server. See [more details](https://cloud.google.com/sql/docs/mysql/flags) | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_db_charset"></a> [db\_charset](#input\_db\_charset) | The charset for the default database | `string` | `""` | no |
| <a name="input_db_collation"></a> [db\_collation](#input\_db\_collation) | The collation for the default database. Example: 'utf8\_general\_ci' | `string` | `""` | no |
| <a name="input_delete_timeout"></a> [delete\_timeout](#input\_delete\_timeout) | The optional timout that is applied to limit long database deletes. | `string` | `"30m"` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Used to block Terraform from deleting a SQL Instance. | `bool` | `true` | no |
| <a name="input_disk_autoresize"></a> [disk\_autoresize](#input\_disk\_autoresize) | Configuration to increase storage size | `bool` | `true` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | The disk size for the master instance | `number` | `10` | no |
| <a name="input_disk_type"></a> [disk\_type](#input\_disk\_type) | The disk type for the master instance. | `string` | `"PD_SSD"` | no |
| <a name="input_enable_default_db"></a> [enable\_default\_db](#input\_enable\_default\_db) | Enable or disable the creation of the default database | `bool` | `true` | no |
| <a name="input_enable_default_user"></a> [enable\_default\_user](#input\_enable\_default\_user) | Enable or disable the creation of the default user | `bool` | `true` | no |
| <a name="input_maintenance_window_day"></a> [maintenance\_window\_day](#input\_maintenance\_window\_day) | The day of week (1-7) for the master instance maintenance. | `number` | `6` | no |
| <a name="input_maintenance_window_hour"></a> [maintenance\_window\_hour](#input\_maintenance\_window\_hour) | The hour of day (0-23) maintenance window for the master instance maintenance. | `number` | `23` | no |
| <a name="input_maintenance_window_update_track"></a> [maintenance\_window\_update\_track](#input\_maintenance\_window\_update\_track) | The update track of maintenance window for the master instance maintenance. Can be either `canary` or `stable`. | `string` | `"canary"` | no |
| <a name="input_module_depends_on"></a> [module\_depends\_on](#input\_module\_depends\_on) | List of modules or resources this module depends on. | `list(any)` | `[]` | no |
| <a name="input_pricing_plan"></a> [pricing\_plan](#input\_pricing\_plan) | The pricing plan for the master instance. | `string` | `"PER_USE"` | no |
| <a name="input_random_instance_name"></a> [random\_instance\_name](#input\_random\_instance\_name) | Sets random suffix at the end of the Cloud SQL resource name | `bool` | `false` | no |
| <a name="input_read_replica_deletion_protection"></a> [read\_replica\_deletion\_protection](#input\_read\_replica\_deletion\_protection) | Used to block Terraform from deleting replica SQL Instances. | `bool` | `true` | no |
| <a name="input_read_replica_name_suffix"></a> [read\_replica\_name\_suffix](#input\_read\_replica\_name\_suffix) | The optional suffix to add to the read instance name | `string` | `""` | no |
| <a name="input_read_replicas"></a> [read\_replicas](#input\_read\_replicas) | List of read replicas to create | <pre>list(object({<br>    name = string<br>    zone = string<br><br>  }))</pre> | `[]` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | The tier for the master instance. | `string` | `"db-f1-micro"` | no |
| <a name="input_update_timeout"></a> [update\_timeout](#input\_update\_timeout) | The optional timout that is applied to limit long database updates. | `string` | `"30m"` | no |
