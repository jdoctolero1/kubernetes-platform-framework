output "vm_id" {
  description = "The ID of the EC2 instance"
  value       = module.ec2_control_plane.id
}

output "vm_private_ip" {
  description = "The private IP address of the EC2 instance"
  value       = module.ec2_control_plane.private_ip
}

output "vm_public_ip" {
  description = "The public IP address of the EC2 instance (if assigned)"
  value       = module.ec2_control_plane.public_ip
}