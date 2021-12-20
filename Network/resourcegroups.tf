resource "azurerm_resource_group" "network_main" {
  name     = var.resource_group_name
  location = var.location
  provider = azurerm.Subscription1
}