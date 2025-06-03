output "resource_group_name" {
  value = azurerm_resource_group.rg_lab2025.name
}

output "sql_server_name" {
  value = azurerm_mssql_server.sqlsrv_lab2025.name
}

output "envio_dw_name" {
  value = azurerm_mssql_database.db_envio_dw.name
}

output "reserva_dw_name" {
  value = azurerm_mssql_database.db_reserva_dw.name
}

output "gestion_proyectos_dw_name" {
  value = azurerm_mssql_database.db_gestion_proyectos_dw.name
}
