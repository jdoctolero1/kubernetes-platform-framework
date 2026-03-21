variable "location" {
  type        = string
  description = "Azure region"
}

variable "environment" {
  type        = string
  description = "Environment"
}

variable "kcp_vm_ip" {
  type        = string
  description = "IP Address of the Kubernetes Control Plane VM" 
}

variable "tags" {
  type        = map(string)
  default     = {}
}

variable "admin_username" {
  type        = string
  description = "Admin user name for VM"
}

variable "admin_ssh_key_path" {
  type        = string
  description = "Path to public key for ssh access"
}

variable "kcp_vm_size" {
  type    = string
  default = "Standard_D2s_v3"
}

variable "kcp_image_publisher" {
  type    = string
  default = "canonical"
}

variable "kcp_image_offer" {
  type    = string
  default = "ubuntu-24_04-lts"
}

variable "kcp_image_sku" {
  type    = string
  default = "server"
}

variable "kcp_image_version" {
  type    = string
  default = "latest"
}

variable "kwn_vm_ips" {
  type        = list(string)
  description = "List of private IPs for worker nodes"
}

variable "kwn_vm_size" {
  type        = string
  description = "VM size for worker nodes"
  default     = "Standard_D4als_v6"
}

variable "kwn_image_publisher" {
  type        = string
  description = "Image publisher for worker nodes"
  default     = "canonical"
}

variable "kwn_image_offer" {
  type        = string
  description = "Image offer for worker nodes"
  default     = "ubuntu-24_04-lts"
}

variable "kwn_image_sku" {
  type        = string
  description = "Image SKU for worker nodes"
  default     = "server"
}

variable "kwn_image_version" {
  type        = string
  description = "Image version for worker nodes"
  default     = "latest"
}