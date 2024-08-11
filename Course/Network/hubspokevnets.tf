// Hub VNet
resource "azurerm_virtual_network" "hub_vnet" {
  resource_group_name = var.resource_group_name
  location = var.location
  name = var.hub_vnet_name
  address_space = [var.hub_vnet_address_space]
}

resource "azurerm_subnet" "hub_subnets" {
  count = length(var.hub_subnets)
  resource_group_name = var.resource_group_name
  virtual_network_name = var.hub_vnet_name
  name = local.hub_subnet_names[count.index]
  address_prefixes = [local.hub_subnet_prefixes[count.index]]
}


// Spoke VNets
resource "azurerm_virtual_network" "spoke_vnets" {
  count = length(var.spoke_vnets)
  resource_group_name = var.resource_group_name
  location = var.location
  name = var.spoke_vnets[count.index].name
  address_space = [var.spoke_vnets[count.index].address_space]
}

// Outputs

output "hub_vnet_id" {
  value = azurerm_virtual_network.hub_vnet.id
}