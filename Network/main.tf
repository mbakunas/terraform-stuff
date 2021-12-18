// Terraform config

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0"
    }
  }
}

// Variables
variable "resource_group_name" {
  type = string
}

variable "location" {
  type    = string
  default = "eastus2"
}

variable "vnet_name" {
  type    = string
  default = "VNet-Spoke-Dev-EastUS2-01"
}

variable "vnet_cidr_range" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_prefixes" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "subnet_names" {
  type    = list(string)
  default = ["web", "database"]
}

// Providers
provider "azurerm" {
  alias           = "Subscription1"
  subscription_id = "f0bb6c48-80fd-445c-98cb-c38b5f817d52"
}

provider "azurerm" {
  alias           = "Subscription2"
  subscription_id = "c64ca001-2cce-46de-837e-03f5564fc802"
}

provider "azurerm" {
  alias           = "Subscription3"
  subscription_id = "fac1ea11-e5a7-4e74-8d7e-965344c54f56"
}

provider "azurerm" {
  alias           = "Subscription4"
  subscription_id = "16936380-29b0-4326-8f6b-db86da154736"
}



// Resources
resource "azurerm_resource_group" "network_main" {
  name     = var.resource_group_name
  location = var.location
  provider = azurerm.Subscription1
}

module "vnet-main" {
  source              = "Azure/vnet/azurerm"
  version             = "~> 2.0"
  resource_group_name = azurerm_resource_group.network_main.name
  vnet_name           = var.vnet_name
  address_space       = [var.vnet_cidr_range]
  subnet_prefixes     = var.subnet_prefixes
  subnet_names        = var.subnet_names

  depends_on = [azurerm_resource_group.network_main]
}


// Outputs

output "vnet_id" {
  value = module.vnet-main.vnet_id
}