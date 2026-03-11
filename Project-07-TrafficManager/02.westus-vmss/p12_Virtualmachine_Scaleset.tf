# Resource: Azure Linux Virtual Machine Scale Set - App1
resource "azurerm_linux_virtual_machine_scale_set" "web_vmss01" {
  name = "${local.resource_name_prefix}-web-vmss02"
  resource_group_name = azurerm_resource_group.rg.name 
  location            = azurerm_resource_group.rg.location 
  sku                 = "Standard_DS1_v2"
  instances           = 2
  admin_username      = "azureuser" 
  admin_password = "Password@123"
  custom_data = filebase64("./httpd.sh")
  disable_password_authentication = false
  source_image_reference {
    publisher = "RedHat"
    offer = "RHEL"
    sku = "83-gen2"
    version = "latest"
  }   

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }  

  upgrade_mode = "Automatic"

  network_interface {
    name = "web-vmss-nic"
    primary = "true"
    network_security_group_id = azurerm_network_security_group.web_subnet_nsg.id 
    ip_configuration {
      name = "internal"
      primary = true
      subnet_id = azurerm_subnet.websubnet.id 
      #application_gateway_backend_address_pool_ids = [azurerm_application_gateway.web_ag.backend_address_pool[0].id]
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.web_lb_backend_address_pool.id]
      
    }
  }
}
/*
# Resource: Azure Linux Virtual Machine Scale Set - App2

resource "azurerm_linux_virtual_machine_scale_set" "web_vmss02" {
  name = "${local.resource_name_prefix}-web-vmss02"
  resource_group_name = azurerm_resource_group.rg.name 
  location            = azurerm_resource_group.rg.location 
  sku                 = "Standard_DS1_v2"
  instances           = 2
  admin_username      = "azureuser" 
  admin_password = "Password@123"
  custom_data = filebase64("./httpd.sh")
  disable_password_authentication = false
  source_image_reference {
    publisher = "RedHat"
    offer = "RHEL"
    sku = "83-gen2"
    version = "latest"
  }   

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }  

  upgrade_mode = "Automatic"

  network_interface {
    name = "web-vmss-nic"
    primary = "true"
    network_security_group_id = azurerm_network_security_group.web_subnet_nsg.id 
    ip_configuration {
      name = "internal"
      primary = true
      subnet_id = azurerm_subnet.websubnet.id      
    }
  }
}
*/