locals {
  kubernetes_subnet_prefixes = concat(
    data.azurerm_subnet.subnet_admin.address_prefixes,
    data.azurerm_subnet.subnet_app.address_prefixes
  )

  common_tags = {
    environment = var.environment
    project     = "kubernetes"
  }

  merged_tags = merge(local.common_tags, var.tags)

  network_resource_group = "rg-${var.environment}-network-${var.location}"

  subnet_admin_name    = "subnet-${var.environment}-admin"
  vnet_name            = "vnet-${var.environment}-${var.location}"
  subnet_appgw_name    = "subnet-${var.environment}-app-gateway"
  subnet_app_name      = "subnet-${var.environment}-app"
  keyvault_resource_group = "rg-${var.environment}-keyvault-${var.location}"
}