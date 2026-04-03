variable "agw_name" {
	description = "Name of the Application Gateway"
	type        = string
}

variable "location" {
	description = "Azure region"
	type        = string
}

variable "resource_group_name" {
	description = "Resource group name"
	type        = string
}

variable "sku_name" {
	description = "SKU name (e.g., Standard_v2, WAF_v2)"
	type        = string
	default     = "Standard_v2"
}

variable "sku_tier" {
	description = "SKU tier (e.g., Standard_v2, WAF_v2)"
	type        = string
	default     = "Standard_v2"
}

variable "sku_capacity" {
	description = "Instance count for the Application Gateway"
	type        = number
	default     = 2
}

variable "subnet_id" {
	description = "Subnet ID for the Application Gateway"
	type        = string
}

variable "frontend_port" {
	description = "Frontend port number"
	type        = number
	default     = 80
}

variable "public_ip_id" {
  description = "The id of the Public IP resource."
  type        = string
}

variable "private_ip_address" {
	description = "Private IP address for the frontend configuration (optional)"
	type        = string
	default     = null
}

variable "backend_ip_addresses" {
	description = "List of backend IP addresses"
	type        = list(string)
	default     = []
}

variable "backend_port" {
	description = "Backend port number"
	type        = number
	default     = 80
}

variable "tags" {
	description = "Tags to apply to resources"
	type        = map(string)
	default     = {}
}