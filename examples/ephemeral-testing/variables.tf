//Mandatory
variable "project_id" {
  description = "The project ID to manage the Cloud SQL resources"
  type        = string
  default     = ""
}

variable "name" {
  type        = string
  description = "The name of the Cloud SQL resources"
  default     = ""
}

variable "region" {
  description = "The region of the Cloud SQL resources"
  type        = string
  default     = ""
}

variable "zone" {
  description = "The zone for the master instance, it should be something like: `us-central1-a`, `us-east1-c`."
  type        = string
  default     = ""
}

variable "vpcnetwork" {
  description = "The charset for the default database"
  type        = string
  default     = ""
}

variable "vpcproject" {
  description = "The charset for the default database"
  type        = string
  default     = ""
}

variable "db_name" {
  description = "The name of the default database to create"
  type        = string
  default     = "default"
}

variable "user_name" {
  description = "The name of the default user"
  type        = string
  default     = "postgres"
}

variable "user_password" {
  description = "The password for the default user. If not set, a random one will be generated and available in the generated_user_password output variable."
  type        = string
  default     = ""
}

variable "user_labels" {
  type        = map(string)
  default     = {}
  description = "The key/value labels for the master instances."
}

variable "database_version" {
  description = "The database version to use"
  type        = string
  default     = ""
}

variable "encryption_key_name" {
  description = "The full path to the encryption key used for the CMEK disk encryption"
  type        = string
  default     = ""
}

variable "client_cert_name" {
  description = "name for the client certificate"
  type        = string
  default     = ""
}
variable "deletion_protection" {
  description = "Used to block Terraform from deleting a SQL Instance."
  type        = bool
  default     = true
}

variable "read_replica_deletion_protection" {
  description = "Used to block Terraform from deleting replica SQL Instances."
  type        = bool
  default     = true
}
