output "id" {
  description = "The allocation ID of the Elastic IP"
  value       = aws_eip.this.id
}

output "public_ip" {
  description = "The Elastic IP address"
  value       = aws_eip.this.public_ip
}

output "association_id" {
  description = "The association ID of the Elastic IP (if associated)"
  value       = length(aws_eip_association.this) > 0 ? aws_eip_association.this[0].id : null
}
