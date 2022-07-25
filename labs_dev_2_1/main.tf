terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.15.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
}

resource "azurerm_resource_group" "labs_dev_2_rg" {
  name     = "labs_dev_2_rg"
  location = "eastus2"
}

resource "azurerm_storage_account" "labsdev2" {
    name                     = "labsdev2"
    resource_group_name      = azurerm_resource_group.labs_dev_2_rg.name
    location                 = azurerm_resource_group.labs_dev_2_rg.location
    account_tier             = "Standard"
    account_replication_type = "GRS"
}