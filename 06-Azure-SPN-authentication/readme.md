## Terraform Prerequisites – Azure App Registration & Service Principal Setup
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

Before Terraform can create or manage Azure resources, it must authenticate securely with Azure.

In real-world environments, Terraform does not use personal user accounts.  
Instead, it uses a **Service Principal**, which acts as an identity for automation.

In this module, we will:

- Create an Azure App Registration
- Create a Client Secret
- Collect required authentication details
- Assign required permissions to the subscription

This setup allows Terraform to securely deploy infrastructure in Azure.

---

## Step-02: What is Azure App Registration?

Azure App Registration creates an identity in Azure Active Directory (Microsoft Entra ID).

This identity is used by applications or automation tools like Terraform to access Azure resources.

After creating an App Registration, Azure automatically creates a **Service Principal**.

Terraform uses this Service Principal to authenticate and perform actions.

---

## Step-03: Create Azure App Registration

Navigate to:

**Azure Portal → Microsoft Entra ID → App Registrations**


Steps:

1. Click **New Registration**
2. Provide Application Name
3. Select supported account type
4. Click **Register**

After creation, note the following values:

- Application (Client) ID
- Directory (Tenant) ID

These values are required for Terraform authentication.

---

## Step-04: Create Client Secret

Steps:

1. Open the created App Registration
2. Go to **Certificates & Secrets**
3. Click **New Client Secret**
4. Provide description and expiry duration
5. Click **Add**

Immediately copy and store the secret value securely.

Required value:

- Client Secret

⚠️ Secret value will not be visible again after leaving the page.

---

## Step-05: Collect Required Terraform Authentication Details

Terraform requires the following details:

- Client ID
- Tenant ID
- Client Secret
- Subscription ID

These values will be used in provider authentication.

Prepare a **Provider.tf** file

```
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
  # Configuration options

    subscription_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    client_id       = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    client_secret   = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    tenant_id       = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}
```

## Step-06: Assign Contributor Access to Subscription

Terraform needs permissions to create and manage resources.

Steps:

1. Go to Subscriptions
2. Select the required subscription
3. Open Access Control (IAM)
4. Click Add Role Assignment
5. Select Role: Contributor
6. Assign access to the created App Registration
7. Save changes

This allows Terraform to create and manage resources inside the subscription.

## Step-07: Why Contributor Role?

The Contributor role allows:

Creating resources
Updating resources
Deleting resources

But it does not allow managing access permissions, which makes it safe for automation.

<span style="color:#5B2BBF;">PKsir Message</span>

In real projects, Terraform authentication is always done using Service Principals instead of personal user accounts.

This ensures automation security, controlled access, and better audit tracking.

Always follow least-privilege access and assign only the required permissions.