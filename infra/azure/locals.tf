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
}