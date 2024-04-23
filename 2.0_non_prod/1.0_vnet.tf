# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.azurerm_virtual_network
  address_space       = var.azurerm_virtual_network_address
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Subnet
resource "azurerm_subnet" "subnet" {
  name                 = var.azurerm_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.azurerm_subnet_address
  depends_on           = [azurerm_virtual_network.vnet]
}