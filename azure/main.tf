provider "azurerm" {
  version = "=2.46.0"
  features {}
}

data "azurerm_subscription" "current" {
}
