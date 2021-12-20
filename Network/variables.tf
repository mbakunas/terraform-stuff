variable "resource_group_name" {
  type = string
}

variable "location" {
  type    = string
  default = "eastus2"
}

// Hub VNet
variable "hub_vnet_name" {
  type    = string
  default = "VNet01"
}

variable "hub_vnet_address_space" {
  type    = string
  default = "192.168.0.0/22"
}

variable "hub_subnets" {
  type = map(any)
  default = {
    "gatewaysubnet" = {
      name = "GatewaySubnet",
      address_space = "192.168.0.0/26"
    },
    "azurefirewallsubnet" = {
      name = "AzureFirewallSubnet",
      address_space = "192.168.64.0/26"
    },
    "azurebastionsubnet" = {
      name = "AzureBastionSubnet",
      address_space = "192.168.128.0/26"
    },
    "subnet1" = {
      name = "subnet1-192.168.1.0_24",
      address_space = "192.168.1.0/24"
    },
    "subnet2" = {
      name = "subnet2-192.168.2.0_24",
      address_space = "192.168.2.0/24"
    }
  }
}

// Spoke VNets
variable "spoke_vnets" {
  type = list
  default = [
    {
      name = "VNet02",
      address_space = "192.168.4.0/22",
      subnets = [
        {
          name = "subnet1-192.168.4.0_24",
          address_space = "192.168.4.0/24"
        },
        {
          name = "subnet2-192.168.5.0_24",
          address_space = "192.168.5.0/24"
        },
        {
          name = "subnet3-192.168.6.0_24",
          address_space = "192.168.6.0/24"
        }
      ]
    },
    {
      name = "VNet03",
      address_space = "192.168.8.0/22",
      subnets = [
        {
          name = "subnet1-192.168.8.0_24",
          address_space = "192.168.8.0/24"
        },
        {
          name = "subnet2-192.168.9.0_24",
          address_space = "192.168.9.0/24"
        },
        {
          name = "subnet3-192.168.10.0_24",
          address_space = "192.168.10.0/24"
        }
      ]
    }
  ]
}