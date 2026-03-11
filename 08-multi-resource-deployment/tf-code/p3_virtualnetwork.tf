resource "azurerm_virtual_network" "we_vnet01" {
  name                = "viitor-we-pr-vnet01"
  address_space       = ["172.16.0.0/16"]
  location            = azurerm_resource_group.we_rg01.location
  resource_group_name = azurerm_resource_group.we_rg01.name
}

resource "azurerm_subnet" "private_subnet01" {
  name                 = "private-subnet01"
  resource_group_name  = azurerm_resource_group.we_rg01.name
  virtual_network_name = azurerm_virtual_network.we_vnet01.name
  address_prefixes     = ["172.16.1.0/24"]
}