output "instance_name_1" {
  value       = module.sql_cluster.*.postgresql-name-3.instance_name
  description = "The instance name for the master instance"
}

output "private_address_1" {
  value       = module.sql_cluster.*.postgresql-name-3.private_address
  description = "The private IP address assigned for the master instance"
}

output "instance_connection_name_1" {
  value       = module.sql_cluster.*.postgresql-name-3.instance_connection_name
  description = "The connection name of the master instance to be used in connection strings"
}

output "instance_self_link_1" {
  value       = module.sql_cluster.*.postgresql-name-3.instance_self_link
  description = "The URI of the master instance"
}

output "instance_service_account_email_address_1" {
  value       = module.sql_cluster.*.postgresql-name-3.instance_service_account_email_address
  description = "The service account email address assigned to the master instance"
}

output "instance_logging_monitoring_database_flags_1" {
  value       = module.sql_cluster.*.postgresql-name-3.instance_logging_monitoring_database_flags
  description = "The service account email address assigned to the master instance"
}

output "SQL_encryption_key_name_1" {
  value       = module.sql_cluster.*.postgresql-name-3.instance_encryption_key_name
  description = "The Encryption key assigned to SQL db"
}

output "instance_name_2" {
  value       = module.sql_cluster.*.postgresql-name-4.instance_name
  description = "The instance name for the master instance"
}

output "private_address_2" {
  value       = module.sql_cluster.*.postgresql-name-4.private_address
  description = "The private IP address assigned for the master instance"
}

output "instance_connection_name_2" {
  value       = module.sql_cluster.*.postgresql-name-4.instance_connection_name
  description = "The connection name of the master instance to be used in connection strings"
}

output "instance_self_link_2" {
  value       = module.sql_cluster.*.postgresql-name-4.instance_self_link
  description = "The URI of the master instance"
}

output "instance_service_account_email_address_2" {
  value       = module.sql_cluster.*.postgresql-name-4.instance_service_account_email_address
  description = "The service account email address assigned to the master instance"
}

output "instance_logging_monitoring_database_flags_2" {
  value       = module.sql_cluster.*.postgresql-name-4.instance_logging_monitoring_database_flags
  description = "The service account email address assigned to the master instance"
}

output "SQL_encryption_key_name_2" {
  value       = module.sql_cluster.*.postgresql-name-4.instance_encryption_key_name
  description = "The Encryption key assigned to SQL db"
}