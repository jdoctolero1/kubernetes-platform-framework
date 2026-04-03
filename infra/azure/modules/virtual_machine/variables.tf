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

variable "private_ip" {
  type        = string
  default     = null
  description = "Private IP to associate with the VM NIC"
}

variable "vm_size" {
  type        = string
  default     = "Standard_B2s"
}

variable "admin_username" {
  type        = string
  default     = "azureuser"
}

variable "admin_ssh_key_path" {
  type        = string
  description = "Path to your SSH public key"
}

variable "image_publisher" {
  type    = string
  default = "canonical"
}

variable "image_offer" {
  type    = string
  default = "ubuntu-24_04-lts"
}

variable "image_sku" {
  type    = string
  default = "server"
}

variable "image_version" {
  type    = string
  default = "latest"
}

variable "tags" {
  type    = map(string)
  default = {}
}

