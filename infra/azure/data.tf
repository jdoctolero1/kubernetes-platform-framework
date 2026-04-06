data "azurerm_resource_group" "network_rg" {
  name = "rg-${var.environment}-network-${var.location}"
}

data "azurerm_subnet" "subnet_admin" {
  name                 = "subnet-${var.environment}-admin"
  virtual_network_name = "vnet-${var.environment}-${var.location}"
  resource_group_name  = "rg-${var.environment}-network-${var.location}"
}

data "azurerm_subnet" "subnet_app_gateway" {
  name                 = "subnet-${var.environment}-app-gateway"
  virtual_network_name = "vnet-${var.environment}-${var.location}"
  resource_group_name  = "rg-${var.environment}-network-${var.location}"
}

data "azurerm_subnet" "subnet_app" {
  name                 = "subnet-${var.environment}-app"
  virtual_network_name = "vnet-${var.environment}-${var.location}"
  resource_group_name  = "rg-${var.environment}-network-${var.location}"
}

data "azurerm_resource_group" "keyvault_rg" {
  name = "rg-${var.environment}-keyvault-${var.location}"
}

data "azurerm_key_vault" "keyvault" {
  name                = "kvlabcentralus01"
  resource_group_name = data.azurerm_resource_group.keyvault_rg.name
}

data "azurerm_key_vault_certificate" "certificate" {
  name         = var.cert_name
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

data "azurerm_user_assigned_identity" "appgw_managedid" {
  name                = "managedid-lab-appgw-centralus"
  resource_group_name = "rg-lab-admin-centralus"
}

data "azurerm_dns_zone" "public_dns_zone" {
  name                = var.dns_zone_name
  resource_group_name = var.dns_zone_resource_group_name
}