## Terraform Multiple Provider Blocks on Azure Cloud
## Learn how to use multiple Terraform provider blocks on Azure Cloud
---

<span style="color:#5B2BBF;"><strong>Mentor:</strong></span> Praveen Kumar Gudla (PKsir)  
<span style="color:#5B2BBF;"><strong>Focus Areas:</strong></span> Azure | DevOps | Terraform | Cloud Engineering  
<span style="color:#5B2BBF;"><strong>Industry Experience:</strong></span> 17+ Years  

---

Connect:  
LinkedIn: https://www.linkedin.com/in/praveengudla  
GitHub: https://github.com/scalewithpk  

Learn Cloud the Industry Way — Not Just for Interviews

---

# Multiple Provider Configurations

## Step-01: Introduction
- Understand and Implement Multiple Provider Configurations
In real-world Terraform projects, infrastructure is often deployed across multiple regions or subscriptions.

For example:

- Application resources in **East US**
- Disaster recovery resources in **West US**
- Resources are in One Region and Need to call them in other region

To support this scenario, Terraform allows us to configure **multiple provider configurations** for the same provider.

In this module, we will learn:

- What is a default provider
- How to configure multiple providers of the same type
- How to use provider aliases
- How to deploy resources using different provider configurations

---

## Step-02: How to define multiple provider configuration of same Provider?

Terraform allows multiple configurations of the same provider using **aliases**.

### Default Provider (Provider-1)

The provider without an alias is called the **default provider**.

Resources automatically use this provider unless another provider is specified.
```t
# Provider-1 for EastUS (Default Provider)
provider "azurerm" {
  features {}
}

# Provider-2 for WestUS Region
provider "azurerm" {
  features {
    virtual_machine {
      delete_os_disk_on_deletion = false # This will ensure when the Virtual Machine is destroyed, Disk is not deleted, default is true and we can alter it at provider level
    }
  }
  alias = "provider2-westus"
  #client_id = "XXXX"
  #client_secret = "YYY"
  #environment = "german"
  #subscription_id = "JJJJ"
}
```

## Step-03: How to reference the non-default provider configuration in a resource?
```t
# Provider-2: Create a resource group in WestUS region - Uses "provider2-westus" provider
resource "azurerm_resource_group" "myrg2" {
  name = "myrg-2"
  location = "West US"
    #<PROVIDER NAME>.<ALIAS NAME>
  provider = azurerm.provider2-westus
}
```
# Explanation

* alias creates a second provider configuration
* Both providers belong to the same Azure provider
* Each provider can have different settings
* Useful for multi-region or multi-subscription deployments

## Example use cases:

* East US → Primary region
* West US → Disaster recovery region

## Step-04: Execute Terraform Commands
```t
# Initialize Terraform
terraform init

# Validate Terraform Configuration Files
terraform validate

# Generate Terraform Plan
terraform plan

# Create Resources
terraform apply -auto-approve

# Verify the same
1. Verify the Resource Group created in EastUS region
2. Verify the Resource Group created in WestUS region
```

## Step-05: Clean-Up 
```t
# Destroy Terraform Resources
terraform destroy -auto-approve

# Delete Terraform Files
rm -rf .terraform*
rm -rf terraform.tfstate*
```



## References
- [Provider Meta Argument](https://www.terraform.io/docs/configuration/meta-arguments/resource-provider.html)
- [Azure Provider - Argument and Attribute References](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)


<span style="color:#5B2BBF;">PKsir Message</span>

Multiple provider configurations are commonly used in enterprise environments for multi-region and disaster recovery setups.

Always use clear alias names so that the purpose of each provider configuration is easy to understand and maintain.

```
Terraform
├── Provider (East US - Default)
└── Provider (West US - Alias)
└── Resource Group
```