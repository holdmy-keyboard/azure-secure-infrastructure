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

output "virutal_network_name" {
  description = "Name of the Azure Virtual Network"
  value       = azurerm_virtual_network.main.name
}

output "web_subnet_name" {
  description = "Name of the web subnet"
  value       = azurerm_subnet.web.name
}

output "network_security_group_name" {
  description = "Name of the web Network Security Group"
  value       = azurerm_network_security_group.web.name
}