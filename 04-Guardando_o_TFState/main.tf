terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.12.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "<nome-da-storage_account>" 
    container_name       = "terraform-state"
    key                  = "terraformkt.tfstate"
    resource_group_name  = "<rg-da-storage_account>"
  }  
}

##
## Observar o conteúdo da storage account depois de rodar o init
##

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "<id-da-subscription>"
}

resource "azurerm_resource_group" "rgeastus2" {
  name     = "rg-tfkt-04-eastus2"
  location = "East US 2"
}

resource "azurerm_storage_account" "saeastus2" {
  name                     = "moutfkt04eus2"
  resource_group_name      = azurerm_resource_group.rgeastus2.name
  location                 = azurerm_resource_group.rgeastus2.location
  access_tier              = "Hot"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}