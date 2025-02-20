terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.12.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "<id-da-subscription>"
}

resource "azurerm_resource_group" "rgmoueastus2" {
  name     = "rg-tfkt03-eastus2"
  location = "East US 2"
}

module "storage_account" {
  source              = "./modules/storage_account"
  storage_account_name = "moutfkt03"
  resource_group_name  = azurerm_resource_group.rgmoueastus2.name
  region             = azurerm_resource_group.rgmoueastus2.location
  tiozinho         = "Standard"
  replication_type     = "LRS"
}

# Rodar o plan depois de descomentar o código abaixo
module "sa_container" {
  source              = "./modules/sa_container"
  storage_account_id = module.storage_account.storage_account_id
  container_name       = "mycontainer"
}