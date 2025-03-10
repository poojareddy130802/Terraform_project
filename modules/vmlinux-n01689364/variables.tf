variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location to create the resources"
  type        = string
}

variable "storage_account_uri" {
  description = "The ID of the storage account for boot diagnostics"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the VMs will be deployed"
  type        = string
}

variable "availability_set_name" {
  description = "The name of the availability set"
  type        = string
}

variable "admin_username" {
  description = "The username for the VMs"
  type        = string
}

variable "ssh_public_key_path" {
  description = "The path to the SSH public key"
  type        = string
}

variable "private_key_path" {
  description = "The path to the private key"
  type        = string
}

variable "source_image_reference" {
  description = "The source image reference for the VMs"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
}

variable "vm_names_and_sizes" {
  description = "Map of VM names and sizes"
  type        = map(string)
}
