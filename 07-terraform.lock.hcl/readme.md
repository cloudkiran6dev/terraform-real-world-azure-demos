# Terraform Working Directory – .terraform Folder and Lock File
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

When we run Terraform commands for the first time, Terraform automatically creates additional files and folders inside the working directory.

The most important ones are:

- `.terraform` folder
- `.terraform.lock.hcl` file

Understanding these components is important because they control provider downloads and version consistency.

---

## Step-02: What is the `.terraform` Folder?

The `.terraform` folder is automatically created when we run:

```bash
terraform init
```
## This folder contains:

* Downloaded provider plugins
* Module dependencies
* Backend configuration data
* Internal Terraform metadata

```
.terraform/
 ├── providers/
 ├── modules/
 └── terraform.tfstate (backend related metadata)
```

## Why Terraform Creates This Folder

Terraform needs providers locally to interact with cloud platforms.

Instead of downloading providers every time, Terraform stores them inside the .terraform folder for reuse.

This improves performance and ensures consistent execution.

## Step-03: What is .terraform.lock.hcl File?

The .terraform.lock.hcl file is called the Terraform Dependency Lock File.

This file is automatically created after running:

```
terraform init
```
## Purpose of Lock File

The lock file records:

* Exact provider versions used
* Provider checksums
* Dependency information

This ensures that:

* All team members use the same provider versions
* Terraform behaves consistently across environments
* Unexpected provider upgrades are avoided

## Example Scenario

Without lock file:

* Engineer A downloads provider version 3.70
* Engineer B downloads provider version 3.75
* Infrastructure behavior may differ

With lock file:

* Everyone uses the same provider version.

## Step-04: Best Practice

Always add .terraform/ folder to .gitignore.


<span style="color:#5B2BBF;">PKsir Message</span>

Many beginners delete the lock file thinking it is temporary.

In real projects, the lock file is important because it guarantees consistent provider versions across environments.

Consistency is one of the key advantages of Infrastructure as Code.