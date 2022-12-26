
# Generate a random storage name
resource "random_string" "vm-sta-name" {
  length  = 8
  upper   = false
  numeric = true
  lower   = true
  special = false
}

resource "azurerm_storage_account" "vm-sta" {
  name                     = "${lower(var.company)}tf${random_string.vm-sta-name.result}"
  location                 = azurerm_resource_group.vm-rg.location
  resource_group_name      = azurerm_resource_group.vm-rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}
