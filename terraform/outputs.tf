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
output "vm_name" {
  description = "Name of the Linux virtual machine"
  value       = azurerm_linux_virtual_machine.web.name
}

output "vm_public_ip" {
  description = "Public IP address of the Linux virtual machine"
  value       = azurerm_public_ip.web.ip_address
}

output "vm_private_ip" {
  description = "Private IP address of the Linux virtual machine"
  value       = azurerm_network_interface.web.private_ip_address
}

output "ssh_command" {
  description = "SSH command used to connect to the Linux VM"
  value       = "ssh -i ~/.ssh/azure_secure_infra ${var.admin_username}@${azurerm_public_ip.web.ip_address}"
}

output "log_analytics_workspace_name" {
  description = "Name of the Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.main.name
}

output "data_collection_rule_name" {
  description = "Name of the Azure Monitor Data Collection Rule"
  value       = azurerm_monitor_data_collection_rule.linux.name
}