provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
  }
}

module "rg" {
  source   = "./modules/arm_resource_group"
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}
