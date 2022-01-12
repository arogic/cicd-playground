# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
# azurerm version: 2.89.0

resource "azurerm_resource_group" "resource_group" {
  name     = var.name
  location = var.location
  tags     = var.tags
}

