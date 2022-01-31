
terraform {
  required_version = ">1.0.0"
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}


data "google_compute_network" "postgresql_network" {
  name    = var.vpcnetwork
  project = var.vpcproject
}

locals {
  master_instance_name = var.random_instance_name ? "${var.name}-${random_id.suffix[0].hex}" : var.name

  #default_user_host        = "%"
  ip_configuration_enabled = true

  replicas = {
    for x in var.read_replicas : "${var.name}-replica${var.read_replica_name_suffix}${x.name}" => x
  }

  databases   = { for db in var.additional_databases : db.name => db }
  users       = { for u in var.additional_users : u.name => u }
  IAM_users   = { for u in var.cloud_IAM_users : u.name => u }
  IAM_sausers = { for u in var.cloud_IAM_SAusers : u.name => u }

  // HA method using REGIONAL availability_type requires binary logs to be enabled for mysql
  //binary_log_enabled = var.availability_type == "REGIONAL" ? true : lookup(var.backup_configuration, "binary_log_enabled", null)
  //binary_lod_enabled needs to marked as false for postgresql
  binary_log_enabled = false
  
  //backups_enabled    = var.availability_type == "REGIONAL" ? true : lookup(var.backup_configuration, "enabled", null)
  
  //Irrespective of availability_type, backups will be always enabled for an instance.
  backups_enabled    = true
  retained_backups = lookup(var.backup_configuration, "retained_backups", null)
  retention_unit   = lookup(var.backup_configuration, "retention_unit", null)
}

resource "random_id" "suffix" {
  count = var.random_instance_name ? 1 : 0

  byte_length = 4
}

resource "google_sql_database_instance" "default" {
  provider            = google-beta
  project             = var.project_id
  name                = local.master_instance_name
  database_version    = var.database_version
  region              = var.region
  deletion_protection = var.deletion_protection
  encryption_key_name = var.encryption_key_name

  settings {

     database_flags {
      name  = "autovacuum"
      value = "off"
    }
 
    database_flags {
      name  = "log_min_duration_statement"
      value = -1
    }

    database_flags {
      name  = "log_checkpoints"
      value = "on"
    }
    
    database_flags {
      name  = "log_connections"
      value = "on"
    }

    database_flags {
      name  = "log_disconnections"
      value = "on"
    }

    database_flags {
      name  = "log_lock_waits"
      value = "on"
    }

    database_flags {
      name  = "log_min_messages"
      value = "warning"
    }

    database_flags {
      name  = "log_temp_files"
      value = 0
    }

     database_flags {
      name  = "cloudsql.iam_authentication"
      value = "on"
    }

    tier              = var.tier
    activation_policy = var.activation_policy
    availability_type = var.availability_type
    dynamic "backup_configuration" {
      for_each = [var.backup_configuration]
      content {
        binary_log_enabled             = local.binary_log_enabled
        enabled                        = local.backups_enabled
        start_time                     = lookup(backup_configuration.value, "start_time", null)
        location                       = lookup(backup_configuration.value, "location", null)
        transaction_log_retention_days = lookup(backup_configuration.value, "transaction_log_retention_days", null)

        dynamic "backup_retention_settings" {
          for_each = local.retained_backups != null || local.retention_unit != null ? [var.backup_configuration] : []
          content {
            retained_backups = local.retained_backups
            retention_unit   = local.retention_unit
          }
        }
      }
    }
    ip_configuration {
      ipv4_enabled    = false
      private_network = data.google_compute_network.postgresql_network.id
      require_ssl     = true

      #        dynamic "authorized_networks" {
      #          content {
      #            expiration_time = lookup(authorized_networks.value, "expiration_time", null)
      #            name            = lookup(authorized_networks.value, "name", null)
      #            value           = lookup(authorized_networks.value, "value", null)
      #          }
      #        }
    }

    disk_autoresize = var.disk_autoresize

    disk_size    = var.disk_size
    disk_type    = var.disk_type
    pricing_plan = var.pricing_plan
    user_labels  = var.user_labels
    dynamic "database_flags" {
      for_each = var.database_flags
      content {
        name  = lookup(database_flags.value, "name", null)
        value = lookup(database_flags.value, "value", null)
      }
    }

    location_preference {
      zone = var.zone
    }

    maintenance_window {
      day          = var.maintenance_window_day
      hour         = var.maintenance_window_hour
      update_track = var.maintenance_window_update_track
    }
  }

  lifecycle {
    ignore_changes = [
      settings[0].disk_size
    ]
  }

  timeouts {
    create = var.create_timeout
    update = var.update_timeout
    delete = var.delete_timeout
  }

  depends_on = [null_resource.module_depends_on]
}

resource "google_sql_database" "default" {
  count      = var.enable_default_db ? 1 : 0
  name       = var.db_name
  project    = var.project_id
  instance   = google_sql_database_instance.default.name
  charset    = var.db_charset
  collation  = var.db_collation
  depends_on = [null_resource.module_depends_on, google_sql_database_instance.default]
}

resource "google_sql_database" "additional_databases" {
  for_each   = local.databases
  project    = var.project_id
  name       = each.value.name
  charset    = lookup(each.value, "charset", null)
  collation  = lookup(each.value, "collation", null)
  instance   = google_sql_database_instance.default.name
  depends_on = [null_resource.module_depends_on, google_sql_database_instance.default]
}

resource "google_sql_user" "default" {
  //count      = var.enable_default_user ? 1 : 0
  name       = var.user_name
  project    = var.project_id
  instance   = google_sql_database_instance.default.name
  #host       = var.user_host
  password   = var.user_password
  depends_on = [null_resource.module_depends_on, google_sql_database_instance.default]
}

resource "google_sql_user" "additional_users" {
  for_each   = local.users
  project    = var.project_id
  name       = each.value.name
  password   = lookup(each.value, "password")
  #host       = lookup(each.value, "host", var.user_host)
  instance   = google_sql_database_instance.default.name
  depends_on = [null_resource.module_depends_on, google_sql_database_instance.default]
}

resource "google_sql_user" "users" {
  for_each = local.IAM_users
  name     = each.value.name
  instance = google_sql_database_instance.default.name
  type     = "CLOUD_IAM_USER"
}

resource "google_sql_user" "sausers" {
  for_each = local.IAM_sausers
  name     = each.value.name
  instance = google_sql_database_instance.default.name
  type     = "CLOUD_IAM_SERVICE_ACCOUNT"
}

resource "null_resource" "module_depends_on" {
  triggers = {
    value = length(var.module_depends_on)
  }
}

resource "google_sql_database_instance" "replicas" {
  for_each             = local.replicas
  project              = var.project_id
  name                 = "${local.master_instance_name}-replica${var.read_replica_name_suffix}${each.value.name}"
  database_version     = var.database_version
  region               = join("-", slice(split("-", lookup(each.value, "zone", var.zone)), 0, 2))
  master_instance_name = google_sql_database_instance.default.name
  deletion_protection  = var.read_replica_deletion_protection

  replica_configuration {
    failover_target = false
  }

  settings {
    database_flags {
      name  = "autovacuum"
      value = "off"
    }
 
    database_flags {
      name  = "log_min_duration_statement"
      value = -1
    }

    database_flags {
      name  = "log_checkpoints"
      value = "on"
    }
    
    database_flags {
      name  = "log_connections"
      value = "on"
    }

    database_flags {
      name  = "log_disconnections"
      value = "on"
    }

    database_flags {
      name  = "log_lock_waits"
      value = "on"
    }

    database_flags {
      name  = "log_min_messages"
      value = "warning"
    }

    database_flags {
      name  = "log_temp_files"
      value = 0
    }

     database_flags {
      name  = "cloudsql.iam_authentication"
      value = "on"
    }

    tier              = lookup(each.value, "tier", var.tier)
    activation_policy = "ALWAYS"

    ip_configuration {
      ipv4_enabled    = false
      private_network = data.google_compute_network.postgresql_network.id
      require_ssl     = true

      #        dynamic "authorized_networks" {
      #          for_each = lookup(ip_configuration.value, "authorized_networks", [])
      #          content {
      #            expiration_time = lookup(authorized_networks.value, "expiration_time", null)
      #            name            = lookup(authorized_networks.value, "name", null)
      #            value           = lookup(authorized_networks.value, "value", null)
      #          }
      #        }

    }

    disk_autoresize = var.disk_autoresize
    disk_size       = var.disk_size
    disk_type       = var.disk_type
    pricing_plan    = var.pricing_plan
    user_labels     = var.user_labels

    dynamic "database_flags" {
      for_each = var.database_flags
      content {
        name  = lookup(database_flags.value, "name", null)
        value = lookup(database_flags.value, "value", null)
      }
    }

    location_preference {
      zone = lookup(each.value, "zone", var.zone)
    }

  }

  depends_on = [google_sql_database_instance.default]
  lifecycle {
    ignore_changes = [
      settings[0].disk_size,
      settings[0].maintenance_window,
    ]
  }

  timeouts {
    create = var.create_timeout
    update = var.update_timeout
    delete = var.delete_timeout
  }
}

resource "google_sql_ssl_cert" "client_cert" {
  common_name = var.client_cert_name
  instance    = google_sql_database_instance.default.name
}

//Please generate the client ssl certificate separately as per best practices
/*
resource "google_sql_ssl_cert" "replica_client_cert" {
  for_each    = local.replicas
  common_name = var.client_cert_name
  instance    = "${local.master_instance_name}-replica${var.read_replica_name_suffix}${each.value.name}"
}
*/
