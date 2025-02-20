variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "region" {
  description = "The location/region where the storage account will be created"
  type        = string
}

variable "tiozinho" {
  description = "The storage account tier"
  type        = string
}

variable "replication_type" {
  description = "The storage account replication type"
  type        = string
}