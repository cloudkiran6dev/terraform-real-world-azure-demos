resource "azurerm_storage_account" "we_sa01" {
  name                     = "scalewithpk01"
  resource_group_name      = azurerm_resource_group.we_rg01.name
  location                 = azurerm_resource_group.we_rg02.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    owner = "pk"
    environment = "prod"
  }
}