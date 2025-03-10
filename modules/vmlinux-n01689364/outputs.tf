output "availability_set_name" {
  value = azurerm_availability_set.vms_availability_set.name
}

output "vm_hostnames" {
  value = values(azurerm_linux_virtual_machine.linux_vm)[*].name
}

output "vm_fqdns" {
  value = values(azurerm_public_ip.public_ip)[*].fqdn
}

output "vm_private_ips" {
  value = values(azurerm_network_interface.nic)[*].private_ip_address
}

output "vm_public_ips" {
  value = values(azurerm_public_ip.public_ip)[*].ip_address
}

output "vm_ids" {
  value = values(azurerm_linux_virtual_machine.linux_vm)[*].id
}

output "vm_nic_ids" {
  value = values(azurerm_network_interface.nic)[*].id
}
