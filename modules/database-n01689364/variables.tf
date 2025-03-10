variable "resource_group_name" {
  description = "The name of the Azure resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
}

variable "server_name" {
  description = "The name of the PostgreSQL server"
  type        = string
}

variable "db_name" {
  description = "The name of the PostgreSQL database"
  type        = string
}

variable "storage_mb" {
  description = "The storage capacity of the PostgreSQL server in MB"
  type        = number
}

variable "backup_retention_days" {
  description = "The number of days to retain backups for"
  type        = number
}

variable "admin_username" {
  description = "The administrator username for the PostgreSQL database"
  type        = string
}

variable "admin_password" {
  description = "The administrator password for the PostgreSQL database"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
}
