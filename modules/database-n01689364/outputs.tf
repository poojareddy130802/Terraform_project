output "postgresql_server_name" {
  value = azurerm_postgresql_server.postgresql_server.name
}

output "postgres_db_name" {
  value = azurerm_postgresql_database.db.name
}