output "fqdn" {
  description = "The FQDN of the DNS A record."
  value       = azurerm_dns_a_record.dns_a_record.fqdn
}
