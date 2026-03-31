output "id" {
	description = "The ID of the Application Gateway."
	value       = azurerm_application_gateway.app_gw.id
}

output "frontend_ip" {
	description = "The frontend IP address of the Application Gateway."
	value       = azurerm_application_gateway.app_gw.frontend_ip_configuration[0].private_ip_address
}
