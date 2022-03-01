variable "project_id" {
  description = "The project ID to manage the Cloud SQL resources"
}

variable "name" {
  type        = string
  description = "The name of the Cloud SQL resources"
}

variable "random_instance_name" {
  type        = bool
  description = "Sets random suffix at the end of the Cloud SQL resource name"
  default     = false
}

// required
variable "database_version" {
  description = "The database version to use"
  type        = string
}

// required
variable "region" {
  description = "The region of the Cloud SQL resources"
  type        = string
}

// Master
variable "tier" {
  description = "The tier for the master instance."
  type        = string
  default     = "db-f1-micro"
}

variable "zone" {
  description = "The zone for the master instance, it should be something like: `us-central1-a`, `us-east1-c`."
  type        = string
}

variable "activation_policy" {
  description = "The activation policy for the master instance. Can be either `ALWAYS`, `NEVER` or `ON_DEMAND`."
  type        = string
  validation {
    condition = var.activation_policy == "ALWAYS" || var.activation_policy == "NEVER" || var.activation_policy == "ON_DEMAND"
    error_message = "The activation policy for the master instance must be set to  `ALWAYS` or `NEVER` or `ON_DEMAND`."
  }
  default     = "ALWAYS"
}

variable "availability_type" {
  description = "The availability type for the master instance. Can be either `REGIONAL` or `ZONAL`."
  type        = string
  validation {
    condition = var.availability_type == "REGIONAL" || var.availability_type == "ZONAL"
    error_message = "The availability type for the master instance must be set to either `REGIONAL` or `ZONAL`."
  }
  default     = "ZONAL"
}

variable "disk_autoresize" {
  description = "Configuration to increase storage size"
  type        = bool
  default     = true
}

variable "disk_size" {
  description = "The disk size for the master instance"
  type        = number
  default     = 10
}

variable "disk_type" {
  description = "The disk type for the master instance."
  type        = string
  default     = "PD_SSD"
}

variable "pricing_plan" {
  description = "The pricing plan for the master instance."
  type        = string
  validation {
    condition     = var.pricing_plan == "PER_USE"
    error_message = "Pricing plan for the instance can only be PER_USE."
  } 
  default     = "PER_USE"
}

variable "maintenance_window_day" {
  description = "The day of week (1-7) for the master instance maintenance."
  type        = number
  default     = 6
}

variable "maintenance_window_hour" {
  description = "The hour of day (0-23) maintenance window for the master instance maintenance."
  type        = number
  default     = 23
}

variable "maintenance_window_update_track" {
  description = "The update track of maintenance window for the master instance maintenance. Can be either `canary` or `stable`."
  type        = string
  validation {
    condition     = var.maintenance_window_update_track == "canary" || var.maintenance_window_update_track == "stable"
    error_message = "The update track of maintenance window for the master instance maintenance must be set to `canary` or `stable`."
  }
  default     = "canary"
}

variable "database_flags" {
  description = "List of Cloud SQL flags that are applied to the database server. See [more details](https://cloud.google.com/sql/docs/mysql/flags)"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}


variable "user_labels" {
  type        = map(string)
  description = "The key/value labels for the master instances."
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
    binary_log_enabled             = false
    enabled                        = true
    start_time                     = "00:30"
    location                       = null
    transaction_log_retention_days = null
    retained_backups               = null
    retention_unit                 = null
  }
}


// Read Replicas
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

variable "db_name" {
  description = "The name of the default database to create"
  type        = string
}

variable "db_charset" {
  description = "The charset for the default database"
  type        = string
  default     = ""
}

variable "vpcnetwork" {
  description = "The charset for the default database"
  type        = string
}

variable "vpcproject" {
  description = "The charset for the default database"
  type        = string
}

variable "db_collation" {
  description = "The collation for the default database. Example: 'en_US.UTF8'"
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

variable "user_name" {
  description = "The name of the default user"
  type        = string
  default     = "postgres"
}


variable "user_host" {
  description = "The host for the default user"
  type        = string
  default     = "%"
}


variable "user_password" {
  description = "The password for the default user. If not set, a random one will be generated and available in the generated_user_password output variable."
  type        = string
  sensitive   = true
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
  default     = "30m"
}

variable "update_timeout" {
  description = "The optional timout that is applied to limit long database updates."
  type        = string
  default     = "30m"
}

variable "delete_timeout" {
  description = "The optional timout that is applied to limit long database deletes."
  type        = string
  default     = "30m"
}

variable "encryption_key_name" {
  description = "The full path to the encryption key used for the CMEK disk encryption"
  type        = string
    validation {
    condition     = length(var.encryption_key_name) > 4 && contains(split("/", var.encryption_key_name), "keyRings") 
    //substr(var.image_id, 0, 7) == "projects"
    error_message = "The encryption_key_name should not be null and must be a valid one, contains\"keyRings\"."
  }
}

variable "module_depends_on" {
  description = "List of modules or resources this module depends on."
  type        = list(any)
  default     = []
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

variable "enable_default_db" {
  description = "Enable or disable the creation of the default database"
  type        = bool
  default     = true
}

//  Google cloud creates a default user named 'postgres' irrespective of the below variable set to true or false.
/*
variable "enable_default_user" {
  description = "Enable or disable the creation of the default user"
  type        = bool
  default     = false
}
*/

#variable "enable_client_ssl" {
#  description = "Enable or disable the creation of the client ssl"
#  type        = bool
#  default     = true
#}

variable "client_cert_name" {
  description = "name for the client certificate"
  type        = string
  validation {
    condition     = length(var.client_cert_name) > 0
    error_message = "The client_cert_name should not be null."
  }
}

