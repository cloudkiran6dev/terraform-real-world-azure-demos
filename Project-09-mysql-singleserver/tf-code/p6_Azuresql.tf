# Resource-1: Azure SQL Server

resource "azurerm_mssql_server" "azuresql_server" {
  name                         = "${local.resource_name_prefix}-${var.sql_db_name}-${var.sql_server_name}"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = "west europe"
  version                      = "12.0"
  administrator_login          = var.sql_db_username
  administrator_login_password = var.sql_db_password
  minimum_tls_version          = "1.2"
  azuread_administrator {
  login_username = "AzureAD Admin"
  object_id      = "b77ab9b9-b367-423e-b71b-4e5672f358b7"
}

}

# Resource-2: Azure SQL Database / Schema

resource "azurerm_mssql_database" "example" {
  name         = "${local.resource_name_prefix}-${var.sql_db_name}"
  server_id    = azurerm_mssql_server.azuresql_server.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  # prevent the possibility of accidental data loss
  # lifecycle {
  #   prevent_destroy = true
  # }
}
