module "kubernetes_rg" {
  source   = "./modules/rg"
  name     = "rg-${var.environment}-kubernetes-${var.location}"
  location = var.location
  tags     = local.merged_tags
}

module "kcp_vm" {
  source              = "./modules/vm"
  vm_name             = "vm-${var.environment}-kcp-${var.location}-01"
  resource_group_name = module.kubernetes_rg.name
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

module "kwn_vm" {
  source              = "./modules/vm"
  count               = length(var.kwn_vm_ips)
  vm_name             = "vm-${var.environment}-kwn-${var.location}-${count.index + 1}"
  resource_group_name = module.kubernetes_rg.name
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

module "kubernetes_nsg" {
  source              = "./modules/nsg"
  nsg_name            = "nsg-${var.environment}-kubernetes-${var.location}"
  location            = var.location 
  resource_group_name = data.azurerm_resource_group.network_rg.name
  tags = local.merged_tags

  rules = {
    "allow_kubernetes_api" = {
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "6443"
      source_address_prefixes    = local.kubernetes_subnet_prefixes
      destination_address_prefix = "*"
    }

    "allow_kubelet" = {
      priority                   = 101
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "10250"
      source_address_prefixes    = local.kubernetes_subnet_prefixes
      destination_address_prefix = "*"
    }

    "allow_ssh" = {
      priority                   = 102
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefixes    = local.kubernetes_subnet_prefixes
      destination_address_prefix = "*"
    }
  }

  depends_on = [module.kcp_vm]

  network_interface_ids = {
    kcp_vm = module.kcp_vm.vm_nic_id
  }
}