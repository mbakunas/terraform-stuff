// Terraform config
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0"
    }
  }

  backend "azurerm" {
    key = "terraform.tfstate"
    
  }
}


// Providers
provider "azurerm" {
  features {}
}

provider "azurerm" {
  features {}

  alias           = "Subscription1"
  subscription_id = "f0bb6c48-80fd-445c-98cb-c38b5f817d52"
}

/*
provider "azurerm" {
  features {}
  
  alias           = "Subscription2"
  subscription_id = "c64ca001-2cce-46de-837e-03f5564fc802"
}

provider "azurerm" {
  features {}
  
  alias           = "Subscription3"
  subscription_id = "fac1ea11-e5a7-4e74-8d7e-965344c54f56"
}

provider "azurerm" {
  features {}
  
  alias           = "Subscription4"
  subscription_id = "16936380-29b0-4326-8f6b-db86da154736"
}
*/