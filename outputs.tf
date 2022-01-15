output "instance_name" {
  value       = google_sql_database_instance.default.name
  description = "The instance name for the master instance"
}

output "private_address" {
  value       = google_sql_database_instance.default.private_ip_address
  description = "The private IP address assigned for the master instance"
}

output "instance_connection_name" {
  value       = google_sql_database_instance.default.connection_name
  description = "The connection name of the master instance to be used in connection strings"
}

output "instance_self_link" {
  value       = google_sql_database_instance.default.self_link
  description = "The URI of the master instance"
}

output "instance_service_account_email_address" {
  value       = google_sql_database_instance.default.service_account_email_address
  description = "The service account email address assigned to the master instance"
}

output "instance_logging_monitoring_database_flags" {
  value       = [for r in google_sql_database_instance.default.settings : r.database_flags]
  description = "The service account email address assigned to the master instance"
}

output "instance_encryption_key_name" {
  value       = google_sql_database_instance.default.encryption_key_name
  description = "The service account email address assigned to the master instance"
}

output "instance_ssl_cert_name" {
  value       = google_sql_ssl_cert.client_cert.common_name
  description = "The service account email address assigned to the master instance"
}

output "Iam_Cloud_Sql_user" {
  value       = [for r in google_sql_user.users : r.name]
  description = "The service account email address assigned to the master instance"
}

output "Iam_Cloud_Sql_sauser" {
  value       = [for r in google_sql_user.sausers : r.name]
  description = "The service account email address assigned to the master instance"
}

#output "instance_replica_ssl_cert_name" {
#  value       = [for r in google_sql_ssl_cert.replica_client_cert : r.common_name]
#  description = "The service account email address assigned to the master instance"
#}
