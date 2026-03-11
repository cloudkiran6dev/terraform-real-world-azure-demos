
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