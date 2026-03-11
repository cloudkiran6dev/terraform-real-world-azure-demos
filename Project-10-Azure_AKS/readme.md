# Azure SQL Server and Database using Terraform
---

<span style="color:#5B2BBF;"><strong>Mentor:</strong></span> Praveen Kumar Gudla (PKsir)  
<span style="color:#5B2BBF;"><strong>Focus Areas:</strong></span> Azure | DevOps | Terraform | Cloud Engineering  
<span style="color:#5B2BBF;"><strong>Industry Experience:</strong></span> 17+ Years  

---

## Step-00: Introduction

In this module, we will create:

1. Azure SQL Server
2. Azure SQL Database

In real-world applications, databases are critical components used to store application data securely and reliably.

Using Terraform, we will automate the deployment of Azure SQL infrastructure in a consistent and repeatable manner.

---

## Architecture Overview

The infrastructure created in this module includes:

- Azure Resource Group
- Azure SQL Server
- Azure SQL Database

Relationship:

```
Resource Group
└── Azure SQL Server
└── Azure SQL Database
```
## Administrator Credentials

The administrator login and password should:

    * Never be hardcoded in Terraform files
    * Always be stored securely
    * Be passed using variables or environment variables

## Recommended approaches:

    * Use terraform.tfvars (for lab/demo)
    * Use environment variables
    * Use Azure Key Vault (for production)
    * Hardcoding credentials increases security risk.

## Azure AD Administrator

Configuring an Azure AD administrator improves identity-based authentication.

Benefits:

    * Centralized identity management
    * Better security control
    * Integration with corporate Active Directory
    * Avoids dependency on SQL authentication alone
    * Using Azure AD authentication is a recommended best practice.

## Azure SQL Database

The Azure SQL Database is created inside the Azure SQL Server.

A SQL Server can host multiple databases.

The database configuration defines:

    * Database name
    * Collation
    * License type
    * Maximum size
    * Pricing SKU
    * Security options

Understanding Key Parameters
sku_name

The sku_name defines the pricing tier and performance level of the database.

## Examples:

Basic – Suitable for small workloads
    * S0 – Standard tier for moderate workloads
    * S1 – Higher performance than S0
    * P1 – Premium tier for high-performance workloads

Choosing the correct SKU depends on:

    * Application workload
    * Performance requirements
    * Budget considerations

## prevent_destroy (Optional)

The prevent_destroy lifecycle argument protects the database from accidental deletion.

```
lifecycle {
  prevent_destroy = true
}
```

Why use this?

    * Prevents accidental data loss
    * Adds an extra safety layer in production
    * Terraform will throw an error if destroy is attempted