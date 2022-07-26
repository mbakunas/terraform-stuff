terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.15.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "labs_dev_2_2_rg" {
  name     = "labs_dev_2_2_rg"
  location = "eastus2"
}

// need vnet and a subnet
resource "azurerm_virtual_network" "VNet01" {
  name                = "VNet01"
  location            = azurerm_resource_group.labs_dev_2_2_rg.location
  resource_group_name = azurerm_resource_group.labs_dev_2_2_rg.name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "CorpNet"
    address_prifix = "10.0.1.0/24"
  }
}

// need a vm and a nic
resource "azurerm_network_interface" "vm01nic" {
  name = "VM01-NIC"
  location = azurerm_resource_group.labs_dev_2_2_rg.location
  resource_group_name = azurerm_resource_group.labs_dev_2_2_rg.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_virtual_network.subnet[0].id
    private_ip_address_allocation = "Dynamic"
  } 
}

resource "azurerm_windows_virtual_machine" "VM01" {
  name = "VM01"
  resource_group_name = azurerm_resource_group.labs_dev_2_2_rg.name
  location = azurerm_resource_group.labs_dev_2_2_rg.location
  size = "Standard_B2s"
  admin_username = "azureAdmin"
  admin_password = "C0mplexPassw0rd!"
  network_interface_ids = [
    azurerm_network_interface.vm01nic.nic
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_typr = "Standard_LRD"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter-gensecond"
    version   = "latest"
  }
}