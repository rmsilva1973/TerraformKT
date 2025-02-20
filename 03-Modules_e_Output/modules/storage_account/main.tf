# Este módulo cria uma storage account
resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.region
  account_tier             = var.tiozinho
  account_replication_type = var.replication_type
}