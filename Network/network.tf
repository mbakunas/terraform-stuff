
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