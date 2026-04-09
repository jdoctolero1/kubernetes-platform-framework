data "azurerm_resource_group" "network_rg" {
  name = local.network_resource_group
}

data "azurerm_subnet" "subnet_admin" {
  name                 = local.subnet_admin_name
  virtual_network_name = local.vnet_name
  resource_group_name  = local.network_resource_group
}

data "azurerm_subnet" "subnet_app_gateway" {
  name                 = local.subnet_appgw_name
  virtual_network_name = local.vnet_name
  resource_group_name  = local.network_resource_group
}

data "azurerm_subnet" "subnet_app" {
  name                 = local.subnet_app_name
  virtual_network_name = local.vnet_name
  resource_group_name  = local.network_resource_group
}

data "azurerm_resource_group" "keyvault_rg" {
  name = local.keyvault_resource_group
}

data "azurerm_key_vault" "keyvault" {
  name                = var.key_vault_name
  resource_group_name = data.azurerm_resource_group.keyvault_rg.name
}

data "azurerm_key_vault_certificate" "certificate" {
  name         = var.cert_name
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

data "azurerm_user_assigned_identity" "appgw_managedid" {
  name                = var.agw_managedid_name
  resource_group_name = var.managedid_resource_group
}

data "azurerm_dns_zone" "public_dns_zone" {
  name                = var.dns_zone_name
  resource_group_name = var.dns_zone_resource_group_name
}