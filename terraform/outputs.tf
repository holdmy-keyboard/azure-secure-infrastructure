output "resource_group_name" {
  description = "Name of the Azure Resource Group"
  value       = azurerm_resource_group.main.name
}

output "resource_group_location" {
  description = "Azure region of the Resource Group"
  value       = azurerm_resource_group.main.location
}

output "resource_group_id" {
  description = "Azure Resource ID of the Resource Group"
  value       = azurerm_resource_group.main.id
}
