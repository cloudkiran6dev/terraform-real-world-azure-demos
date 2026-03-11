## Terraform Demo – Creating Multiple Azure Resources
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

## Step-01: Introduction

In this module, we will create multiple Azure resources using Terraform.

The objective of this exercise is to understand how Terraform can manage multiple resources within a single configuration and how resources are connected together.

This is the first step towards building real-world infrastructure using Infrastructure as Code (IaC).

---

## Step-02: Resources Created in This Demo

In this demo, we will create the following Azure resources:

- Two Resource Groups
- One Virtual Network (VNet)
- One Subnet
- One Storage Account

This example helps in understanding:

- Managing multiple resources
- Resource dependencies
- Infrastructure organization using Terraform

---

## Step-03: Architecture Overview

The infrastructure created in this demo follows this structure:

```
Resource Group 1
└── Virtual Network
└── Subnet

Resource Group 2
└── Storage Account

```

### refer the code tf-code

```
tf_code
└── p1_provider.tf
└── p2_resourcegroup.tf
└── p3_virtualnetwork.tf
└── p4_storageaccount.tf
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

### After completing this demo, you will understand:

How to create multiple resources in a single Terraform configuration
How Terraform manages dependencies automatically
How resource references work between resources
How infrastructure is built step-by-step using Terraform


<span style="color:#5B2BBF;">PKsir Message</span>

In real projects, infrastructure is never created as a single resource.

Always think in terms of connected resources and dependencies.

Terraform helps automate this process, but understanding how resources relate to each other is the key to writing good infrastructure code.