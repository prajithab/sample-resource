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

output "instance_local_infile_skip_show_database_value" {
  value       = module.sql_cluster.instance_local_infile_skip_show_database_value
  description = "The service account email address assigned to the master instance"
}

output "instance_encryption_key_name" {
  value       = module.sql_cluster.instance_encryption_key_name
  description = "The service account email address assigned to the master instance"
}

output "instance_ssl_cert_name" {
  value       = module.sql_cluster.instance_ssl_cert_name
  description = "The service account email address assigned to the master instance"
}

output "IAM_Cloud_SQL_SAUser" {
  value       = module.sql_cluster.Iam_Cloud_Sql_sauser
  description = "The service account email address assigned to the master instance"
}

output "IAM_Cloud_SQL_User" {
  value       = module.sql_cluster.Iam_Cloud_Sql_user
  description = "The service account email address assigned to the master instance"
}

#output "instance_replica_ssl_cert_name" {
#  value       = module.sql_cluster.instance_replica_ssl_cert_name
#  description = "The service account email address assigned to the master instance"
#}