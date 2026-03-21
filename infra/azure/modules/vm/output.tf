output "vm_id" {
  value = azurerm_linux_virtual_machine.azure_vm.id
}

output "vm_private_ip" {
  value = azurerm_network_interface.azure_nic.private_ip_address
}

output "vm_nic_id" {
  value = azurerm_network_interface.azure_nic.id
}