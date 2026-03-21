output "nsg_id" {
  description = "The ID of the Network Security Group"
  value       = azurerm_network_security_group.nsg.id
}

output "nsg_name" {
  description = "The name of the Network Security Group"
  value       = azurerm_network_security_group.nsg.name
}

output "nsg_resource_group_name" {
  description = "The resource group name of the NSG"
  value       = azurerm_network_security_group.nsg.resource_group_name
}

output "nsg_details" {
  description = "Complete NSG object"
  value       = azurerm_network_security_group.nsg
}