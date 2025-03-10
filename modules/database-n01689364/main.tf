resource "azurerm_postgresql_server" "postgresql_server" {
  name                         = var.server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "11"
  sku_name                     = "B_Gen5_1"
  storage_mb                   = var.storage_mb
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password
  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = false
  ssl_enforcement_enabled      = true
  tags                         = var.tags
}

resource "azurerm_postgresql_database" "db" {
  name                = var.db_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.postgresql_server.name
  charset             = "UTF8"
  collation           = "en_US.utf8"
}
