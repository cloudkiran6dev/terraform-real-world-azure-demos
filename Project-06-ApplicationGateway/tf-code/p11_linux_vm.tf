/*
# Resource: Azure Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "web_linuxvm" {
  name = "${local.resource_name_prefix}-web-linuxvm"
  #computer_name = "web-linux-vm" # Hostname of the VM (Optional)
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location 
  size = "Standard_DS1_v2"
  admin_username = "azadmin"
  admin_password = "Password@123"
  disable_password_authentication = false
  network_interface_ids = [ azurerm_network_interface.web_linuxvm_nic.id ]
  custom_data = filebase64("./httpd.sh")

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }  
  source_image_reference {
    publisher = "RedHat"
    offer = "RHEL"
    sku = "83-gen2"
    version = "latest"
  }  
  #custom_data = filebase64("${path.module}/app-scripts/redhat-webvm-script.sh")
  #custom_data = base64encode(local.webvm_custom_data)
}

resource "azurerm_linux_virtual_machine" "web_linuxvm02" {
  name = "${local.resource_name_prefix}-web-linuxvm02"
  #computer_name = "web-linux-vm" # Hostname of the VM (Optional)
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location 
  size = "Standard_DS1_v2"
  admin_username = "azadmin"
  admin_password = "Password@123"
  disable_password_authentication = false
  network_interface_ids = [ azurerm_network_interface.web_linuxvm_nic02.id ]
  custom_data = filebase64("./httpd.sh")

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }  
  source_image_reference {
    publisher = "RedHat"
    offer = "RHEL"
    sku = "83-gen2"
    version = "latest"
  }  
}

*/
