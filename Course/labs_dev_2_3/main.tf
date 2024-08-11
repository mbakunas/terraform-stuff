terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.15.1"
    }
  }
  backend "azurerm" {
    resource_group_name  = "TF-State-01"
    storage_account_name = "bakunastfstate01"
    container_name       = "labsdev"
    key                  = "tflab3.terraform.tfstate"  // the name of the blob that stores the state
    
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "labs_dev_2_3_rg" {
  name     = "labs_dev_2_2_rg"
  location = "eastus2"
}