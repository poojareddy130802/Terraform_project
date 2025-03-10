locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "pooja.reddy"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}

module "rgroup" {
  source              = "./modules/rgroup-n01689364"
  resource_group_name = "n01689364-RG"
  location            = "East US"
  tags                = local.common_tags
}

module "network" {
  source               = "./modules/network-n01689364"
  resource_group_name  = module.rgroup.rg_name
  location             = "East US"
  vnet_name            = "n01689364-VNET"
  vnet_address_space   = ["10.0.0.0/16"]
  subnet_name          = "n01689364-SUBNET"
  subnet_address_space = ["10.0.1.0/24"]
  nsg_name             = "n01689364-NSG"
  tags                 = local.common_tags
}

module "common" {
  source               = "./modules/common-n01689364"
  resource_group_name  = module.rgroup.rg_name
  location             = "East US"
  log_analytics_name   = "n01689364-LAW"
  recovery_vault_name  = "n01689364-RSV"
  storage_account_name = "n01689364stacc"
  tags                 = local.common_tags
}

module "linux_vms" {
  source                = "./modules/vmlinux-n01689364"
  resource_group_name   = module.rgroup.rg_name
  location              = "East US"
  subnet_id             = module.network.subnet_id
  availability_set_name = "n01689364-LINUX-AVS"
  storage_account_uri   = module.common.storage_account_uri
  admin_username        = "n01689364"
  ssh_public_key_path   = "~/.ssh/id_rsa.pub"
  private_key_path      = "~/.ssh/id_rsa"
  vm_names_and_sizes = {
    "n01689364-vm-c-1" = "Standard_B1ms"
  }
  source_image_reference = {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }
  tags = local.common_tags
}

module "windows_vms" {
  source                = "./modules/vmwindows-n01689364"
  resource_group_name   = module.rgroup.rg_name
  location              = "East US"
  subnet_id             = module.network.subnet_id
  availability_set_name = "n01689364-WINDOWS-AVS"
  storage_account_uri   = module.common.storage_account_uri
  admin_username        = "n01689364"
  admin_password        = "P@ssw0rd1234!"
  vm_name               = "windows-vm"
  vm_count              = 1
  dns_label             = "n01689364-vm-w"
  vm_size               = "Standard_B1ms"
  source_image_reference = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
  tags = local.common_tags
}

module "data_disk" {
  source              = "./modules/datadisk-n01689364"
  resource_group_name = module.rgroup.rg_name
  location            = "East US"
  disk_name           = "n01689364-DATA-DISK"
  virtual_machine_ids = concat(module.linux_vms.vm_ids, module.windows_vms.vm_ids)
  disk_count          = 2
  tags                = local.common_tags
}

module "load_balancer" {
  source              = "./modules/loadbalancer-n01689364"
  resource_group_name = module.rgroup.rg_name
  location            = "East US"
  lb_name             = "n01689364-LB"
  vm_nics             = concat(module.linux_vms.vm_nic_ids, module.windows_vms.vm_nic_ids)
  tags                = local.common_tags
}

module "database" {
  source                = "./modules/database-n01689364"
  resource_group_name   = module.rgroup.rg_name
  location              = "East US"
  server_name           = "n01689364-db-svr"
  db_name               = "n01689364-db"
  admin_username        = "n01689364"
  admin_password        = "P@ssw0rd1234!"
  storage_mb            = 5120
  backup_retention_days = 7
  tags                  = local.common_tags
}
