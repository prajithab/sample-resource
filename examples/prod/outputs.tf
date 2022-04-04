output "instance_name" {
  value       = module.sql_cluster.instance_name
  description = "The instance name for the master instance"
}

output "private_address" {
  value       = module.sql_cluster.private_address
  description = "The private IP address assigned for the master instance"
}

output "instance_connection_name" {
  value       = module.sql_cluster.instance_connection_name
  description = "The connection name of the master instance to be used in connection strings"
}

output "instance_self_link" {
  value       = module.sql_cluster.instance_self_link
  description = "The URI of the master instance"
}

output "instance_service_account_email_address" {
  value       = module.sql_cluster.instance_service_account_email_address
  description = "The service account email address assigned to the master instance"
}

output "instance_logging_monitoring_database_flags" {
  value       = module.sql_cluster.instance_logging_monitoring_database_flags
  description = "The service account email address assigned to the master instance"
}

output "SQL_encryption_key_name" {
  value       = module.sql_cluster.instance_encryption_key_name
  description = "The Encryption key assigned to SQL db"
}