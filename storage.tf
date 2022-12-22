resource "random_id" "rg_storage_account" {
  keepers = {
    resource_group = azurerm_resource_group.rg.name
  }
  byte_length = 8
}
resource "azurerm_storage_account" "storage_account" {
  name                     = "storage${random_id.rg_storage_account.hex}"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}
