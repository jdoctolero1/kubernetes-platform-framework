resource "azurerm_dns_a_record" "dns_a_record" {
  name                = var.record_name
  zone_name           = var.dns_zone_name
  resource_group_name = var.dns_zone_resource_group_name
  ttl                 = var.ttl
  records             = var.ip_addresses
  tags                = var.tags
}
