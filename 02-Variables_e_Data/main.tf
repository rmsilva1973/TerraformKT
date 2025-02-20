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

##
## Vamos criar um resource group com variáveis
##
resource "azurerm_resource_group" "rg" {
  location = var.rg_location
  name     = "${var.rg_name}-${var.rg_location}"
}

##
## Vamos consultar no console os dados e olhar os containers
##
data "azurerm_storage_account" "moutestsa" {
  name                = "moutest"
  resource_group_name = "rg-shd-enecad"
}

resource "azurerm_storage_container" "container" {
  name                  = "newcontainer"
  storage_account_id = data.azurerm_storage_account.moutestsa.id
  container_access_type = "private"
}