variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure resource group"
  type        = string
}

variable "availability_set_name" {
  description = "The name of the availability set"
  type        = string
}

variable "vm_count" {
  description = "The number of Windows VMs to create"
  type        = number
}

variable "vm_name" {
  description = "The base name of the Windows VMs"
  type        = string
}

variable "dns_label" {
  description = "The DNS label for the public IP addresses"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the Windows VMs"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the Windows VMs"
  type        = string
}

variable "vm_size" {
  description = "The size of the Windows VM"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID where the Windows VMs will be deployed"
  type        = string
}

variable "storage_account_uri" {
  description = "The storage account ID used for VM boot diagnostics"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}

variable "source_image_reference" {
  description = "The reference to the source image for the Windows VMs"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}
