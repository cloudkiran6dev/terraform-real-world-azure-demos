/*
# Resource-1: Create Public IP Address for Web VM01
resource "azurerm_public_ip" "web_linuxvm_publicip" {
  name = "${local.resource_name_prefix}-web-linuxvm-publicip"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  allocation_method = "Static"
  sku = "Standard"
  domain_name_label = "app1-vm-${random_string.myrandom.id}"
}

# Resource-2: Create Public IP Address for web VM02
resource "azurerm_public_ip" "web_linuxvm_publicip02" {
  name = "${local.resource_name_prefix}-web-linuxvm-publicip02"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  allocation_method = "Static"
  sku = "Standard"
  domain_name_label = "app1-vm002-${random_string.myrandom.id}"
}
*/

# Resource-3: Create Public IP Address for Virtual Machine Scale Set
resource "azurerm_public_ip" "web_vmss_publicip01" {
  name = "${local.resource_name_prefix}-web-vmss-publicip01"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  allocation_method = "Static"
  sku = "Standard"
  domain_name_label = "app1-vm02-${random_string.myrandom.id}"
}

