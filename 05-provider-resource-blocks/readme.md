## Terraform Settings, Providers and Resource Blocks
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
## Introduction

In this session, we will understand three important Terraform blocks used in every Terraform project:

1. **Terraform Block (Settings Block)**
2. **Provider Block**
3. **Resource Block**

These blocks define:

- How Terraform should behave
- Which cloud provider Terraform should use
- What infrastructure Terraform should create

Understanding these blocks is essential before creating real infrastructure.

---

### Terraform Block

The **Terraform block** is used to configure Terraform itself.

It helps in:

- Defining required Terraform CLI version
- Defining required provider versions
- Configuring backend storage for state files
- Managing Terraform settings

Why is this important?

Because infrastructure should behave consistently across different environments and team members.

---

### Provider Block

#### What are Terraform Providers?

Providers are plugins that allow Terraform to interact with cloud platforms and services.

Examples:

- Azure
- AWS
- Google Cloud
- Kubernetes

#### What do Providers do?

Providers are responsible for:

- Creating resources
- Updating resources
- Deleting resources
- Reading infrastructure information

#### Where do Providers reside?

Providers are downloaded from the **Terraform Registry**.

Terraform Registry:
https://registry.terraform.io

#### How Providers are Used?

Terraform automatically downloads required providers during:


# To view my Terraform CLI Version installed on my desktop
terraform version

```t
# Play with Terraform CLI Version (We installed 1.0.0 version)
  required_version = "~> 0.14.3" - Will fail
  required_version = "~> 0.14"   - Will fail  
  required_version = "= 0.14.4"  - Will fail
  required_version = ">= 0.13"   - will pass
  required_version = "= 1.0.0"   - will pass
  required_version = "1.0.0"     - will pass 
  required_version = ">= 1.0.0"   - will pass   
 
# Terraform Block
terraform {
  required_version = ">= 1.0.0"
}

# To view my Terraform CLI Version installed on my desktop
terraform version

# Initialize Terraform
terraform init
```


### What are Terraform Providers?

Terraform Providers are plugins that allow Terraform to interact with external platforms and services.

Providers act as a bridge between Terraform and cloud platforms.

Examples:

- Azure
- AWS
- Google Cloud
- Kubernetes

Reference:
- [Terraform Provider Configuration](https://www.terraform.io/docs/language/providers/configuration.html)

---

### What Do Providers Do?

Providers are responsible for:

- Creating infrastructure resources
- Updating existing resources
- Deleting resources
- Reading infrastructure information

For example:

The **Azure Provider** allows Terraform to create:

- Resource Groups
- Virtual Networks
- Virtual Machines
- Storage Accounts

---

### Where Do Providers Reside?

Terraform providers are downloaded from the **Terraform Registry**.

Terraform Registry:
https://registry.terraform.io

When we run:
terraform init
Terraform automatically downloads the required providers defined in the configuration.

---

## Provider Requirements
---

Provider requirements are defined inside the **Terraform Block**.

This helps Terraform understand:

- Which provider to use
- From where to download it
- Which version should be used

```t
# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0"
    }
  }
}
```


##  Provider Block  
- Create a Provider Block for Azure Resource Management `azurerm`
```t
# Provider Block
provider "azurerm" {
features {}
}
```
- Discuss about [Authentication Types](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#authenticating-to-azure) 
- Authenticating to Azure using the Azure CLI
- Authenticating to Azure using Managed Service Identity
- Authenticating to Azure using a Service Principal and a Client Certificate
- Authenticating to Azure using a Service Principal and a Client Secret  
- Finally, understand about [Features Block](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#features) in Provider Block 
```t
# Initialize Terraform
terraform init

# Validate Terraform Configuration files
terraform validate

# Execute Terraform Plan
terraform plan
```  

## Add Provider and play with Provider version
- `required_providers` block specifies all of the providers required by the current module, mapping each local provider name to a source address and a version constraint.

```t
# Play with Provider Version
      version = "~> 2.0"            
      version = ">= 2.0.0, < 2.60.0"
      version = ">= 2.0.0, <= 2.64.0"

# Terraform Init with upgrade option to change provider version
terraform init -upgrade
```

### LAB:

### Create a simple resource block tf-code\1.resourcegroup.tf

```t
# Resource Block
# Create a resource group
resource "azurerm_resource_group" "rg01" {
  name = "scalewithpk-rg01"
  location = "west europe"
}
```


## Execute Terraform commands 
```t
# Initialize Terraform
terraform init

# Validate Terraform Configuration files
terraform validate

# Execute Terraform Plan
terraform plan

# Create Resources using Terraform Apply
terraform apply -auto-approve
```  

## Clean-Up 
```t
# Destroy Terraform Resources
terraform destroy -auto-approve

# Delete Terraform Files
rm -rf .terraform*
rm -rf terraform.tfstate*
```


## References
- [Terraform Providers](https://www.terraform.io/docs/configuration/providers.html)
- [Azure Provider Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Azure Resource Group Terraform Resource](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group)
- [Terraform Version Constraints](https://www.terraform.io/docs/configuration/version-constraints.html)
- [Terraform Versions - Best Practices](https://www.terraform.io/docs/configuration/version-constraints.html#best-practices)


<span style="color:#5B2BBF;">PKsir Message</span>

Terraform providers are the connection between Terraform and the cloud platform.

If the provider configuration is clear and version-controlled, infrastructure behavior becomes stable and predictable.

Always define provider source and version explicitly to avoid unexpected changes in future deployments.
