# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tutorial-tfstate-rg"
    storage_account_name = "tutorialtfns6sk39i"
    container_name       = "tutorial-core-tfstate"
    key                  = "core.tutorial.tfstate"
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}
