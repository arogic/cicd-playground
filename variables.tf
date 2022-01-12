variable "location" {
  description = "Azure Location"
  default     = "westeurope"
}

variable "resource_group_name" {
  description = "Azure Resource Group Name"
  default     = "test-rg"
}

variable "virtual_network_name" {
  description = "Azure Virtual Network name"
  default     = "vnet-test"
}

variable "tags" {
  description = "Azure Resource Tags"
  default = {
    "environment" = "development"
  }
}
