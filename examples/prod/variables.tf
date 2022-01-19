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
  default     = "default"
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

//optional

variable "disk_size" {
  description = "The disk size for the master instance"
  type        = number
  default     = 10
}

variable "tier" {
  description = "The tier for the master instance."
  type        = string
  default     = ""
}

variable "read_replicas" {
  description = "List of read replicas to create"
  type = list(object({
    name = string
    zone = string
  }))
  default = []
}

variable "read_replica_name_suffix" {
  description = "The optional suffix to add to the read instance name"
  type        = string
  default     = ""
}

variable "additional_databases" {
  description = "A list of databases to be created in your cluster"
  type = list(object({
    name      = string
    charset   = string
    collation = string
  }))
  default = []
}

variable "additional_users" {
  description = "A list of users to be created in your cluster"
  type = list(object({
    name     = string
    password = string
    host     = string
  }))
  default = []
}

variable "cloud_IAM_users" {
  description = "A list of users to be created in your cluster"
  type = list(object({
    name = string
  }))
  default = []
}

variable "cloud_IAM_SAusers" {
  description = "A list of users to be created in your cluster"
  type = list(object({
    name = string
  }))
  default = []
}

variable "create_timeout" {
  description = "The optional timout that is applied to limit long database creates."
  type        = string
  default     = ""
}

variable "update_timeout" {
  description = "The optional timout that is applied to limit long database updates."
  type        = string
  default     = ""
}

variable "module_depends_on" {
  description = "List of modules or resources this module depends on."
  type        = list(any)
  default     = []
}

variable "availability_type" {
  description = "The availability type for the master instance. Can be either `REGIONAL` or `ZONAL`."
  type        = string
  default     = "REGIONAL"
}

variable "maintenance_window_day" {
  description = "The day of week (1-7) for the master instance maintenance."
  type        = number
  default     = 1
}

variable "maintenance_window_hour" {
  description = "The hour of day (0-23) maintenance window for the master instance maintenance."
  type        = number
  default     = 0
}

variable "maintenance_window_update_track" {
  description = "The update track of maintenance window for the master instance maintenance. Can be either `canary` or `stable`."
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

variable "backup_configuration" {
  description = "The backup_configuration settings subblock for the database setings"
  type = object({
    binary_log_enabled             = bool
    enabled                        = bool
    start_time                     = string
    location                       = string
    transaction_log_retention_days = string
    retained_backups               = number
    retention_unit                 = string
  })
  default = {
    binary_log_enabled             = true
    enabled                        = true
    start_time                     = "00:30"
    location                       = null
    transaction_log_retention_days = null
    retained_backups               = null
    retention_unit                 = null
  }
}
