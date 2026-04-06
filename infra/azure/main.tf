module "kube_rg" {
  source   = "./modules/resource_group"
  name     = "rg-${var.environment}-kubernetes-${var.location}"
  location = var.location
  tags     = local.merged_tags
}

module "kube_cp_vm" {
  source              = "./modules/virtual_machine"
  vm_name             = "vm-${var.environment}-kcp-${var.location}-01"
  resource_group_name = module.kube_rg.name
  location            = var.location
  subnet_id           = data.azurerm_subnet.subnet_admin.id
  private_ip          = var.kcp_vm_ip
  vm_size             = var.kcp_vm_size
  admin_username      = var.admin_username 
  admin_ssh_key_path  = var.admin_ssh_key_path
  image_publisher     = var.kcp_image_publisher
  image_offer         = var.kcp_image_offer
  image_sku           = var.kcp_image_sku
  image_version       = var.kcp_image_version

  tags = var.tags
}

module "kube_worker_vm" {
  source              = "./modules/virtual_machine"
  count               = length(var.kwn_vm_ips)
  vm_name             = "vm-${var.environment}-kwn-${var.location}-0${count.index + 1}"
  resource_group_name = module.kube_rg.name
  location            = var.location
  subnet_id           = data.azurerm_subnet.subnet_app.id
  private_ip          = var.kwn_vm_ips[count.index]
  vm_size             = var.kwn_vm_size
  admin_username      = var.admin_username 
  admin_ssh_key_path  = var.admin_ssh_key_path
  image_publisher     = var.kwn_image_publisher
  image_offer         = var.kwn_image_offer
  image_sku           = var.kwn_image_sku
  image_version       = var.kwn_image_version
  tags                = var.tags
}

module "kube_pip" {
  source              = "./modules/public_ip"
  public_ip_name      = "pip-${var.environment}-kube-${var.location}-01"
  resource_group_name = module.kube_rg.name
  location            = var.location
  tags                = var.tags
}

module "kube_agw" {
  source              = "./modules/app_gateway"
  agw_name            = "agw-${var.environment}-kube-${var.location}-01"
  resource_group_name = module.kube_rg.name
  location            = var.location
  subnet_id           = data.azurerm_subnet.subnet_app_gateway.id
  public_ip_id        = module.kube_pip.id
  tags                = var.tags
  sku_name            = "Basic"
  sku_tier            = "Basic"
  frontend_port       = 80
  backend_port        = 30007
  backend_ip_addresses = var.kwn_vm_ips
  ssl_secret_id        = data.azurerm_key_vault_certificate.certificate.secret_id
  user_assigned_identity_id = data.azurerm_user_assigned_identity.appgw_managedid.id
}

module "kube_dns_a_record" {
  source                       = "./modules/public_dns"
  dns_zone_name                = data.azurerm_dns_zone.public_dns_zone.name
  dns_zone_resource_group_name = var.dns_zone_resource_group_name
  record_name                  = var.dns_record_name
  ip_addresses                 = [module.kube_pip.ip_address]
  tags                         = local.merged_tags
}