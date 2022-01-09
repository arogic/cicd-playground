variable "location" {
  description = "Azure Location"
  default     = "westeurope"
}

variable "resource_group_name" {
  description = "Azure Resource Group Name"
  default     = "test-rg"
}

variable "tags" {
  description = "Azure Resource Tags"
  default = {
    "environment" = "development"
  }
}
