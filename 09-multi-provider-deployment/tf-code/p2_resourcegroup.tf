
##### Resource Block (RG,vNet, bastion,VM,AzureSQL..,etc)

resource "azurerm_resource_group" "we_rg01" {
#Arguments(Inputs)  = Attributes(Outputs)
  name = "viitor-we-pr-rg001"
  location = "west europe"
  tags = {
    owner = "pk"
    environment = "prod"
    "Bussiness UNIT" = "IT"
  }
}


resource "azurerm_resource_group" "we_rg02" {
#Arguments(Inputs)  = Attributes(Outputs)
  name = "viitor-we-pr-rg003"
  location = "eastus"
  tags = {
    owner = "pk"
    environment = "prod"
  }
}

#Create a resource group in WestUS region - Uses "provider2-westus" provider
resource "azurerm_resource_group" "myrg2" {
  name = "myrg-2"
  location = "West US"
  provider = azurerm.provider2-westus
}


/*
Additional Note: 
provider = <PROVIDER NAME>.<ALIAS NAME>  # This is a Meta-Argument from Resources Section nothing but a Special Argument
*/