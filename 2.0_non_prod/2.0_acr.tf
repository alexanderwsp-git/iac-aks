resource "azurerm_container_registry" "acr" {
  name                = var.azurerm_container_registry_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard"
}