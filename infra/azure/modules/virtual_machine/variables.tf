variable "vm_name" {
  type        = string
  description = "Name of the VM"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID where the VM NIC will be placed"
}

variable "private_ip_address_allocation" {
  type        = string
  default     = "Static"
  description = "Private IP allociation: Static or Dynamic"  
}

variable "private_ip" {
  type        = string
  default     = null
  description = "Private IP to associate with the VM NIC"
}
variable "vm_size" {
  type        = string
  default     = "Standard_B2s"
  description = "Size of the VM"
}

variable "admin_username" {
  type        = string
  default     = "azureuser"
  description = "Username for the VM administrator account"
}
variable "admin_ssh_key_path" {
  type        = string
  description = "Path to your SSH public key"
}

variable "image_publisher" {
  type        = string
  default     = "canonical"
  description = "Image publisher name"
}

variable "image_offer" {
  type        = string
  default     = "ubuntu-24_04-lts"
  description = "Image offer name"
}

variable "image_sku" {
  type        = string
  default     = "server"
  description = "Image SKU"
}

variable "image_version" {
  type        = string
  default     = "latest"
  description = "Image version"
}

variable "os_disk_caching" {
  type        = string
  default     = "ReadWrite"
  description = "OS disk caching type"
}

variable "os_disk_storage_account_type" {
  type        = string
  default     = "Standard_LRS"
  description = "OS disk storage account type"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to resources"
}

