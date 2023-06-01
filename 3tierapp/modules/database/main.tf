# Database resources
resource "azurerm_mariadb_server" "database" {
  name                         = var.database_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  sku_name                     = "B_Gen5_2"
  version                      = "10.2"
  ssl_enforcement_enabled      = true
  administrator_login          = var.primary_database_admin
  administrator_login_password = var.primary_database_password
}

resource "azurerm_mariadb_database" "database" {
  name                = var.database_name
  server_name         = azurerm_mariadb_server.database.name
  resource_group_name = var.resource_group_name
  charset             = "utf8mb4"
  collation           = "utf8mb4_unicode_520_ci"
}