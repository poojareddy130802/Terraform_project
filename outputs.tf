output "resource_group_name" {
  value = module.rgroup.rg_name
}

output "vnet_name" {
  value = module.network.vnet_name
}

output "subnet_name" {
  value = module.network.subnet_name
}

output "nsg_name" {
  value = module.network.nsg_name
}

output "vnet_address_space" {
  value = module.network.vnet_address_space
}

output "subnet_address_space" {
  value = module.network.subnet_address_space
}

output "log_analytics_workspace_name" {
  value = module.common.log_analytics_workspace_name
}

output "recovery_services_vault_name" {
  value = module.common.recovery_services_vault_name
}

output "storage_account_name" {
  value = module.common.storage_account_name
}

output "linux_availability_set_name" {
  value = module.linux_vms.availability_set_name
}

output "linux_vm_hostnames" {
  value = module.linux_vms.vm_hostnames
}

output "linux_vm_fqdns" {
  value = module.linux_vms.vm_fqdns
}

output "linux_vm_private_ips" {
  value = module.linux_vms.vm_private_ips
}

output "linux_vm_public_ips" {
  value = module.linux_vms.vm_public_ips
}

output "windows_availability_set_name" {
  value = module.windows_vms.availability_set_name
}

output "windows_vm_hostnames" {
  value = module.windows_vms.vm_hostnames
}

output "windows_vm_fqdns" {
  value = module.windows_vms.vm_fqdns
}

output "windows_vm_private_ips" {
  value = module.windows_vms.vm_private_ips
}

output "windows_vm_public_ips" {
  value = module.windows_vms.vm_public_ips
}

output "load_balancer_name" {
  value = module.load_balancer.load_balancer_name
}

output "load_balancer_public_ip" {
  value = module.load_balancer.load_balancer_public_ip
}

output "postgresql_server_name" {
  value = module.database.postgresql_server_name
}

output "postgres_db_name" {
  value = module.database.postgres_db_name
}
