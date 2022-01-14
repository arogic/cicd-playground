variable "location" {
  description = "Azure Location"
}

variable "resource_group_name" {
  description = "Azure Resource Group Name"
}

variable "virtual_network_name" {
  description = "Virtual Network Name"
}

variable "tags" {
  description = "List of Resource Tags"
  default     = {}
}
