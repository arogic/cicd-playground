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

module "vnet" {
  source               = "./modules/arm_vnet"
  resource_group_name  = module.rg.name
  location             = module.rg.location
  virtual_network_name = var.virtual_network_name
}

resource "azurerm_app_service" "bad_example" {
  name                = "example-app-service"
  location            = module.rg.location
  resource_group_name = module.rg.name
  app_service_plan_id = "1231313123131231"
}