# azure
# Grupo de recursos
# Activar deploy automático
resource "azurerm_resource_group" "rg_lab2025" {
  name     = "rg-lab2025"
  location = var.location
}

# Servidor MSSQL
resource "azurerm_mssql_server" "sqlsrv_lab2025" {
  name                         = "lab2025sqlsrv"
  resource_group_name          = azurerm_resource_group.rg_lab2025.name
  location                     = azurerm_resource_group.rg_lab2025.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_user
  administrator_login_password = var.sql_admin_password
}

# Base de datos: Envio DW
resource "azurerm_mssql_database" "db_envio_dw" {
  name         = "envio_dw"
  server_id    = azurerm_mssql_server.sqlsrv_lab2025.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  sku_name     = "S0"
}

# Base de datos: Reserva DW
resource "azurerm_mssql_database" "db_reserva_dw" {
  name         = "reserva_dw"
  server_id    = azurerm_mssql_server.sqlsrv_lab2025.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  sku_name     = "S0"
}

# Base de datos: Gestión de Proyectos DW
resource "azurerm_mssql_database" "db_gestion_proyectos_dw" {
  name         = "gestion_proyectos_dw"
  server_id    = azurerm_mssql_server.sqlsrv_lab2025.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  sku_name     = "S0"
}
