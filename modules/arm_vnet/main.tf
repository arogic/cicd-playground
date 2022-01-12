# azurerm version: 2.89.0
# https://registry.terraform.io/providers/hashicorp/azurerm/2.89.0/docs/resources/virtual_network

resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}
