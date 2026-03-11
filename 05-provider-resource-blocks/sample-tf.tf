terraform {
  # Required Terraform Version
  required_version = ">= 1.0.0"  
  # Required Providers and their Versions
  required_providers {            
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0" # Optional but recommended
    }
  }
  # Terraform State Storage to Azure Storage Container
  backend "azurerm" { 
    resource_group_name   = "viitor-we-rg01"
    storage_account_name  = "scalewithpk01"
    container_name        = "tfstatefiles"
    key                   = "terraform.tfstate"
  }  
  experiments = [ example ]# Experimental (Not required)
  provider_meta "my-provider" { # Super Advanced (Not required)
    hello = "Welcome-to-ScalewithPK"
  }
}