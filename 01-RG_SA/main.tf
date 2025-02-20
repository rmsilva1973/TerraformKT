##
## Terraform é um executável que lê arquivos de definição da infraestrutura a ser criada e cria (fontes de IaC), atualiza e remove recursos de infraestrutura.
## O Terraform é executado em um diretório que contém arquivos fontes de IaC.
## Os arquivos fontes de IaC do Terraform são escritos na linguagem HashiCorp Configuration Language (HCL) e tem extensão .tf.
##

## Estrutura dos recursos no Terraform (sintaxe)

## Comandos básicos (rodar e observar a saída de cada um):
##   - terraform init -> Rodar e observar
##   - terraform validate
##   - terraform plan (gerar um arquivo de plano e mostrar)
##   - terraform apply
##   - terraform show
##   - terraform destroy

# State - O que é e como funciona.
# https://www.terraform.io/docs/language/state/index.html

##
## https://developer.hashicorp.com/terraform/language/providers/configuration
##
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.12.0"
    }
  }
}

##
## https://registry.terraform.io/providers/hashicorp/azurerm/latest
##

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "<id-da-subscription>"
}

##
## Vamos criar dois resource groups
##

##
## https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
##
resource "azurerm_resource_group" "rgeastus2" {
  name     = "rg-tfkt-01-eastus2"
  location = "East US 2"
}

##### 

resource "azurerm_resource_group" "rgbrsouth" {
  name     = "rg-tfkt-01-brsouth"
  location = "Brazil South"
}


##
## Vamos criar um novo recurso de storage account na região East US 2
##

##
## https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account
##
resource "azurerm_storage_account" "saeastus2" {
  name                     = "moutfkt01eus2a"
  resource_group_name      = azurerm_resource_group.rgeastus2.name
  location                 = azurerm_resource_group.rgeastus2.location
  access_tier              = "Hot"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

##
## Criando um novo recurso de storage account na região Brazil South
##

# resource "azurerm_storage_account" "sabrsouth" {
#   name                     = "moutfkt01brsouth"
#   resource_group_name      = azurerm_resource_group.rgbrsouth.name
#   location                 = azurerm_resource_group.rgbrsouth.location
#   access_tier              = "Hot"
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

# Alterar o nome de um recurso no código (linha 69) e verificar o que ocorre ao rodar o comando terraform plan
# Alterar uma propriedade que cause uma mudança no recurso (linha 73) sem recriá-lo
# Alterar o nome de um recurso no código (linha 70) e verificar o que ocorre ao rodar o comando terraform apply

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#account_tier

