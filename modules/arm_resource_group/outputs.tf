output "name" {
  description = "Azure Resource Group Name"
  value       = azurerm_resource_group.resource_group.name
}

output "location" {
  description = "Azure Resource Group Location"
  value       = azurerm_resource_group.resource_group.location
}
