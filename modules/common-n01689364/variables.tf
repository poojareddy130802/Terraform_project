variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location to create the resources"
  type        = string
}

variable "log_analytics_name" {
  description = "The name for the Log Analytics Workspace"
  type        = string
}

variable "recovery_vault_name" {
  description = "The name for the Recovery Services Vault"
  type        = string
}

variable "storage_account_name" {
  description = "The name for the Storage Account"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
}
