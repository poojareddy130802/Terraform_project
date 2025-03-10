resource "azurerm_managed_disk" "data_disk" {
  count                = var.disk_count
  name                 = "${var.disk_name}-${count.index + 1}"
  resource_group_name  = var.resource_group_name
  location             = var.location
  storage_account_type = "Standard_LRS"
  disk_size_gb         = 10
  create_option        = "Empty"
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attachment" {
  count              = var.disk_count
  virtual_machine_id = var.virtual_machine_ids[count.index]
  managed_disk_id    = azurerm_managed_disk.data_disk[count.index].id
  lun                = count.index
  caching            = "None"
}