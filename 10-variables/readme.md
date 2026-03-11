---
# Terraform Variables
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

## Step-00: Introduction

In Terraform, **variables** allow us to make infrastructure configurations flexible and reusable.

Instead of hardcoding values inside Terraform files, we can define variables and assign values dynamically.

Using variables helps in:

- Reusing Terraform code across environments
- Avoiding hardcoded values
- Managing configuration more efficiently
- Supporting Dev, Test, and Production deployments

Example scenario:

Instead of writing:

```

location = "West Europe"

```

We can use a variable:

```

location = var.location

````

Now the value can be changed easily without modifying the Terraform code.

---

## Step-01: Types of Terraform Variables

Terraform supports different types of variables.

### 1. Input Variables

Input variables are used to pass values into Terraform configuration.

Example:

```hcl
variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "West Europe"
}
````

Usage:

```hcl
location = var.location
```

---

### 2. Local Values

Local values are used to simplify repeated expressions inside Terraform configuration.

Example:

```hcl
locals {
  resource_prefix = "demo"
}
```

Usage:

```hcl
name = "${local.resource_prefix}-vnet"
```

---

### 3. Output Variables

Output variables display useful information after Terraform execution.

Example:

```hcl
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}
```

Outputs are useful when:

* Passing values between modules
* Displaying deployment results
* Integrating with other automation tools

---

## Step-02: Passing Variable Values

Variables can receive values in multiple ways.

### Method 1: terraform.tfvars file

Create a file:

```
terraform.tfvars
```

Example:

```hcl
location = "West Europe"
resource_group_name = "demo-rg"
```

Terraform automatically reads this file during execution.

---

### Method 2: Command Line

Example:

```bash
terraform apply -var="location=West Europe"
```

---

### Method 3: Environment Variables

Terraform also supports environment variables.

Example:

```
TF_VAR_location="West Europe"
```

---

## Step-03: Variable Types

Terraform supports different data types.

### String

```hcl
type = string
```

Example:

```
location = "West Europe"
```

---

### Number

```hcl
type = number
```

Example:

```
vm_count = 3
```

---

### List

```hcl
type = list(string)
```

Example:

```hcl
subnet_names = ["web", "app", "db"]
```

---

### Map

```hcl
type = map(string)
```

Example:

```hcl
tags = {
  environment = "dev"
  owner       = "team1"
}
```

---

## Step-04: Example Terraform Variable Usage

### variables.tf

```hcl
variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}
```

---

### terraform.tfvars

```hcl
resource_group_name = "demo-rg"
location = "West Europe"
```

---

### main.tf

```hcl
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
```

---

## Step-05: Best Practices

Follow these best practices when using variables:

* Do not hardcode values
* Use `terraform.tfvars` for environment configuration
* Store sensitive variables securely
* Use meaningful variable names
* Organize variables inside `variables.tf`

---

### <span style="color:#5B2BBF;">PKsir Message</span>

Variables are one of the most powerful features in Terraform.

They allow us to write reusable infrastructure code that can be deployed across multiple environments without changing the core configuration.

Always design Terraform code to be flexible using variables instead of hardcoding values.

---
