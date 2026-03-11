terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.58.0"
    }

  }
}

provider "azurerm" {
    features {
      
    }
    subscription_id = "2a6be6ca-1721-4b3b-sdf5-9b772b79effa"
    client_id       = "1e364ff5-e063-4813-sdf3-21a7b5a185da"
    client_secret   = "YoI8Q~CsjbcnzAxgUwerweruX6Sss68bQ24SzcEJ"
    tenant_id       = "cdc1d3d2-2bb9-498f-23245-21ac0b3ffa65"
  # Configuration options
}

# Provider-2 for WestUS
provider "azurerm" {
  features {
    virtual_machine {
      delete_os_disk_on_deletion = false # This will ensure when the Virtual Machine is destroyed, Disk is not deleted, default is true and we can alter it at provider level
    }
  }
  alias = "provider2-westus"
    subscription_id = "2a6be6ca-1721-4b3b-sdf5-9b772b7wert45"
    client_id       = "1e364ff5-e063-4813-sdf3-21a7bererefda"
    client_secret   = "YoI8Q~CsjbcnzAxgUwerwerusdfs23458bQ24SzcEJ"
    tenant_id       = "cdc1d3d2-2bb9-498f-23245-21ac0b3ffa65"
}


# Provider Documentation for Reference
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs