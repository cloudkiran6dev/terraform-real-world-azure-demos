terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.58.0"
    }

  }
  backend "azurerm" {
    resource_group_name   = "terraform-storage-rg"
    storage_account_name  = "scalewithpk02"
    container_name        = "trafficmanager"
    key                   = "project-3-eastus2-terraform.tfstate"
  } 
}
/*
provider "azurerm" {
    features {
      
    }
    subscription_id = "2a6be6ca-1721-4b3b-sdf5-9b772b79effa"
    client_id       = "1e364ff5-e063-4813-sdf3-21a7b5a185da"
    client_secret   = "YoI8Q~CsjbcnzAxgUwerweruX6Sss68bQ24SzcEJ"
    tenant_id       = "cdc1d3d2-2bb9-498f-23245-21ac0b3ffa65"
  # Configuration options
}
*/

provider "azurerm" {
    features {
      
    }
    # subscription_id = "2a6be6ca-1721-4b3b-bab5-9b772b79effa"
    # client_id       = "1e364ff5-e063-4813-bd8e-21a7b5a185da"
    # client_secret   = "YoI8Q~CsjbcnzAxgUyothA5uX6Sss68bQ24SzcEJ"
    # tenant_id       = "cdc1d3d2-2bb9-498f-8206-21ac0b3ffa65"
  # Configuration options
}