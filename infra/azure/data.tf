data "azurerm_subnet" "subnet_admin" {
  name                 = "subnet-${var.environment}-admin"
  virtual_network_name = "vnet-${var.environment}-${var.location}"
  resource_group_name  = "rg-${var.environment}-network-${var.location}"
}

data "azurerm_subnet" "subnet_app" {
  name                 = "subnet-${var.environment}-app"
  virtual_network_name = "vnet-${var.environment}-${var.location}"
  resource_group_name  = "rg-${var.environment}-network-${var.location}"
}

data "azurerm_resource_group" "network_rg" {
  name = "rg-${var.environment}-network-${var.location}"
}
