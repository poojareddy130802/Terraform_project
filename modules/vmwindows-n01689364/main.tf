resource "azurerm_availability_set" "windows_vms_availability_set" {
  name                         = var.availability_set_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  managed                      = true
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
  tags                         = var.tags
}

resource "azurerm_public_ip" "public_ip" {
  count               = var.vm_count
  name                = "${var.vm_name}-${count.index + 1}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Basic"
  domain_name_label   = "${var.dns_label}-${count.index + 1}"
  tags                = var.tags
}

resource "azurerm_network_interface" "nic" {
  count               = var.vm_count
  name                = "${var.vm_name}-${count.index + 1}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip[count.index].id
  }
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
  count               = var.vm_count
  name                = "${var.vm_name}-${count.index + 1}"
  resource_group_name = var.resource_group_name
  location            = var.location
  availability_set_id = azurerm_availability_set.windows_vms_availability_set.id
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.nic[count.index].id
  ]
  source_image_reference {
    publisher = var.source_image_reference.publisher
    offer     = var.source_image_reference.offer
    sku       = var.source_image_reference.sku
    version   = var.source_image_reference.version
  }
  os_disk {
    name                 = "os-disk-${count.index + 1}"
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"

  }
  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }
  tags = var.tags
}

resource "azurerm_virtual_machine_extension" "antimalware_extension" {
  count                = var.vm_count
  name                 = "AntimalwareExtension"
  virtual_machine_id   = azurerm_windows_virtual_machine.windows_vm[count.index].id
  publisher            = "Microsoft.Azure.Security"
  type                 = "IaaSAntimalware"
  type_handler_version = "1.5"
  settings = jsonencode({
    "AntimalwareEnabled" : true,
  })
  depends_on = [azurerm_windows_virtual_machine.windows_vm]
  tags       = var.tags
}
