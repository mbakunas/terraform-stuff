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
    key                  = "tflab4.terraform.tfstate"  // the name of the blob that stores the state
    
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "labs_dev_2_4_rg" {
  name     = "labs_dev_2_4_rg"
  location = "eastus2"
}

resource "azurerm_service_plan" "bakunastflab4_plan" {
  name                = "bakunastflab4_plan"
  resource_group_name = azurerm_resource_group.labs_dev_2_4_rg.name
  location            = azurerm_resource_group.labs_dev_2_4_rg.location
  os_type             = "Linux"
  sku_name            = "S1"
}

resource "azurerm_linux_web_app" "bakunastflab4" {
  name                = "bakunastflab4"
  resource_group_name = azurerm_resource_group.labs_dev_2_4_rg.name
  location            = azurerm_resource_group.labs_dev_2_4_rg.location
  service_plan_id     = azurerm_service_plan.bakunastflab4_plan.id
/*
  app_settings = {
    "DOCKER_REGISTRY_SERVER_URL" = "https://index.docker.io/v1"
  }
*/

  site_config {
    application_stack {
        docker_image     = "nginx"
        docker_image_tag = "latest"
    }
  }
}