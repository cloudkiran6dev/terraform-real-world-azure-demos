# Generic Input Variables
# Business Division
variable "business_divsion" {
  description = "Business Division in the large organization this Infrastructure belongs"
  type = string
  default = "sap"
}
# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type = string
  default = "dev"
}

# Azure Resource Group Name 
variable "resource_group_name" {
  description = "Resource Group Name"
  type = string
  default = "rg-default"  
}

# Azure Resources Location
variable "resource_group_location" {
  description = "Region in which Azure Resources to be created"
  type = string
  default = "eastus2"  
}


# Input variable definitions
variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}
variable "storage_account_tier" {
  description = "Storage Account Tier"
  type        = string
}
variable "storage_account_replication_type" {
  description = "Storage Account Replication Type"
  type        = string
}
variable "storage_account_kind" {
  description = "Storage Account Kind"
  type        = string
}
variable "static_website_index_document" {
  description = "static website index document"
  type        = string
}
variable "static_website_error_404_document" {
  description = "static website error 404 document"
  type        = string
}

# Input Variables
# DB Name
variable "sql_server_name" {

}
variable "sql_db_name" {
  description = "Azure SQL Database Name"
  type        = string
}

# DB Username - Enable Sensitive flag
variable "sql_db_username" {
  description = "Azure SQL Database Administrator Username"
  type        = string
}
# DB Password - Enable Sensitive flag
variable "sql_db_password" {
  description = "Azure SQL Database Administrator Password"
  type        = string
  sensitive   = true
}

# DB Schema Name
variable "sql_db_schema" {
  description = "Azure MySQL Database Schema Name"
  type        = string
}