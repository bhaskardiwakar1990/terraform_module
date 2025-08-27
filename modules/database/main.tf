# Create an Azure SQL Server///////////////////////////
data "azurerm_client_config" "current" {}
resource "azurerm_mssql_server" "sql" {
  name                         = "visionmssqlserver1"
  resource_group_name          = "new-software"
  location                     = "West US"
  version                      = "12.0"
  administrator_login          = "logindministrator"
  administrator_login_password = "loginpass@12345"
  minimum_tls_version          = "1.2"
  azuread_administrator {
    login_username = "Pradeeprana"
    object_id      = data.azurerm_client_config.current.object_id
  }
}
resource "azurerm_mssql_database" "mssql" {
  name         = "Vision-db1"
  server_id    = azurerm_mssql_server.sql.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"
}
resource "azurerm_mssql_firewall_rule" "rule" {
  name             = "visionFirewallRule11"
  server_id        = azurerm_mssql_server.sql.id
  start_ip_address = "10.0.2.4"
  end_ip_address   = "10.0.2.4"
  ////////////


}


