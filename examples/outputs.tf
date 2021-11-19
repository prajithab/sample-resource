output "instance_name" {
  value       = module.sql_cluster.instance_name
  description = "The instance name for the master instance"
}

#output "instance_ip_address" {
#  value       = module.sql_cluster.ip_address
#  description = "The IPv4 address assigned for the master instance"
#}

output "private_address" {
  value       = module.sql_cluster.private_address
  description = "The private IP address assigned for the master instance"
}

#output "instance_first_ip_address" {
#  value       = module.sql_cluster.first_ip_address
#  description = "The first IPv4 address of the addresses assigned for the master instance."
#}

output "instance_connection_name" {
  value       = module.sql_cluster.instance_connection_name
  description = "The connection name of the master instance to be used in connection strings"
}

output "instance_self_link" {
  value       = module.sql_cluster.instance_self_link
  description = "The URI of the master instance"
}
# will it reuired by App team..?
#output "instance_server_ca_cert" {
#  value       = module.sql_cluster.server_ca_cert
#  description = "The CA certificate information used to connect to the SQL instance via SSL"
#}

output "instance_service_account_email_address" {
  value       = module.sql_cluster.instance_service_account_email_address
  description = "The service account email address assigned to the master instance"
}

// Replicas
#output "replicas_instance_first_ip_addresses" {
#  value       = [for r in module.sql_cluster.replicas : r.ip_address]
#  description = "The first IPv4 addresses of the addresses assigned for the replica instances"
#}

#output "replicas_instance_connection_names" {
#  value       = [for r in module.sql_cluster.replicas : r.connection_name]
#  description = "The connection names of the replica instances to be used in connection strings"
#}

#output "replicas_instance_self_links" {
#  value       = [for r in module.sql_cluster.replicas : r.self_link]
#  description = "The URIs of the replica instances"
#}

#output "replicas_instance_server_ca_certs" {
#  value       = [for r in module.sql_cluster.replicas : r.server_ca_cert]
#  description = "The CA certificates information used to connect to the replica instances via SSL"
#}

#output "replicas_instance_service_account_email_addresses" {
#  value       = [for r in module.sql_cluster.replicas : r.service_account_email_address]
#  description = "The service account email addresses assigned to the replica instances"
#}

#output "read_replica_instance_names" {
#  value       = [for r in module.sql_cluster.replicas : r.name]
#  description = "The instance names for the read replica instances"
#}

#output "generated_user_password" {
#  description = "The auto generated default user password if not input password was provided"
#  value       = random_id.user-password.hex
#  sensitive   = true
#}

#output "public_ip_address" {
#  description = "The first public (PRIMARY) IPv4 address assigned for the master instance"
#  value       = module.sql_cluster.public_ip_address
#}
#
#output "private_ip_address" {
#  description = "The first private (PRIVATE) IPv4 address assigned for the master instance"
#  value       = module.sql_cluster.private_ip_address
#}

// Resources
#output "primary" {
#  value       = module.sql_cluster
#  description = "The `module.sql_cluster` resource representing the primary instance"
#  sensitive   = true
#}

#output "replicas" {
#  value       = values(module.sql_cluster.replicas)
#  description = "A list of `module.sql_cluster` resources representing the replicas"
#}

#output "instances" {
#  value       = concat([module.sql_cluster], values(module.sql_cluster.replicas))
#  description = "A list of all `module.sql_cluster` resources we've created"
#  sensitive   = true
#}