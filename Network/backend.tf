terraform {
  backend "azurerm" {
    subscription_id      = "c64ca001-2cce-46de-837e-03f5564fc802"
    storage_account_name = "bakunas"
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"
    use_azuread_auth     = true
  }
}