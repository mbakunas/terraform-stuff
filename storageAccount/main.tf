terraform {
  cloud {
    organization = "Bakunas-Consulting"
    workspaces {
      name = "the-one-workspace"
    }
  }
}



resource "azurerm_storage_account" "storage_account" {
    name                     = "theonestorageaccount9876"
    resource_group_name      = azurerm_resource_group.resource_group.name
    location                 = azurerm_resource_group.resource_group.location
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }

