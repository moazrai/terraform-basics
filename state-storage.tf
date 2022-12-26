# Create a Resource Group for the Terraform state file
resource "azurerm_resource_group" "state-rg" {
  name     = "${lower(var.company)}-tfstate-rg"
  location = var.location
  tags     = var.tags

  lifecycle {
    prevent_destroy = true
  }
}

# Generate a random storage name
resource "random_string" "state-sta-name" {
  length  = 8
  upper   = false
  numeric = true
  lower   = true
  special = false
}

# Create a Storage Account for the Terraform state file
resource "azurerm_storage_account" "state-sta" {
  name                      = "${lower(var.company)}tf${random_string.state-sta-name.result}"
  resource_group_name       = azurerm_resource_group.state-rg.name
  location                  = azurerm_resource_group.state-rg.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  access_tier               = "Hot"
  account_replication_type  = "ZRS"
  enable_https_traffic_only = true
  tags                      = var.tags

  lifecycle {
    prevent_destroy = true
  }
}

# Create a Storage Container for the state file
resource "azurerm_storage_container" "core-container" {
  name                 = "${lower(var.company)}-core-tfstate"
  storage_account_name = azurerm_storage_account.state-sta.name
}
