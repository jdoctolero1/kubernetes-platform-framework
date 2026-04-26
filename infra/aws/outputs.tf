output "vm_id" {
  description = "The ID of the EC2 instance"
  value       = module.vm.id
}

output "vm_private_ip" {
  description = "The private IP address of the EC2 instance"
  value       = module.vm.private_ip
}

output "vm_public_ip" {
  description = "The public IP address of the EC2 instance (if assigned)"
  value       = module.vm.public_ip
}
